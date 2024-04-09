import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handy_man/home.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Handy Man",
      "image": "assets/images/splash1.png",
      "title": "Hello"
    },
    {
      "text": "We help people conect with services \naround thair  area.",
      "image": "assets/images/splash2.png",
      "title": "select Location"
    },
    {
      "text":
          "We Connect you with the right Handy man\nfor the service you need",
      "image": "assets/images/splash1.png",
      "title": "Select Service"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.amber,
                      ),
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => OnboardContent(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                      title: splashData[index]['title'],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: currentPage == index ? 20 : 6,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? const Color.fromARGB(255, 236, 77, 19)
                                    : const Color.fromARGB(255, 216, 216, 216),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 100,
                          child: SizedBox(),
                        ),
                        IconButton(
                          onPressed: currentPage == splashData.length - 1
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomeScreen()),
                                  );
                                }
                              : () => pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn),
                          icon: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: Color.fromARGB(255, 236, 77, 19),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 28,
                                height: 28,
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-right.svg',
                                  semanticsLabel: 'My SVG Image',
                                  height: 28,
                                  width: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 24,
            top: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class OnboardContent extends StatefulWidget {
  const OnboardContent({
    Key? key,
    this.text,
    this.title,
    this.image,
  }) : super(key: key);
  final String? text, image, title;

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ),
        Text(
          widget.title!,
          style: const TextStyle(
            fontSize: 32,
            color: Color.fromARGB(255, 246, 86, 29),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
