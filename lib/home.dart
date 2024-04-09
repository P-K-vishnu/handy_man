import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeHeader(),
              OfferSection(),
              SecondSection(),
              ServicesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

const servicesList = [1, 2, 3, 4, 5, 6];

List<Map<String, String>> offerData = [
  {
    "offer": "60% off on first booking",
    "icon": "assets/images/splash1.svg",
    "code": "WC60"
  },
  {"offer": "20% off on ", "icon": "assets/images/splash1.svg", "code": "WC60"},
  {
    "offer": "60% off on all booking for first users",
    "icon": "assets/images/splash1.svg",
    "code": "WC60"
  },
];

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/add_location.svg',
            semanticsLabel: 'My SVG Image',
            height: 28,
            width: 28,
          ),
        ),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: const Color.fromARGB(255, 40, 40, 40), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Search.svg',
                    semanticsLabel: 'My SVG Image',
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/chat-alt.svg',
            semanticsLabel: 'My SVG Image',
            height: 28,
            width: 28,
          ),
        ),
        IconButton(
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            semanticsLabel: 'My SVG Image',
            height: 28,
            width: 28,
          ),
        ),
      ],
    );
  }
}

class ItemCards extends StatelessWidget {
  const ItemCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 213, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'offers',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 7, 85, 255),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'WCOFF60',
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/add_location.svg',
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'Offers 🔥',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  // backgroundColor: Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: FlutterCarousel(
                options: CarouselOptions(
                  height: 90.0,
                  showIndicator: false,
                  floatingIndicator: false,
                ),
                items: offerData.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return const ItemCards();
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Padding(
            padding: EdgeInsets.only(top: 12),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'New additions 🆕',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  // backgroundColor: Colors.amber,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 12.0,
            left: 14,
            right: 14,
          ),
          child: ItemCards(),
        ),
      ],
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14, top: 16),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Services',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                // backgroundColor: Colors.amber,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.start,
            children: [
              ButtonCards(),
              ButtonCards(),
              ButtonCards(),
              ButtonCards(),
              ButtonCards(),
              ButtonCards(),
              ButtonCards(),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonCards extends StatelessWidget {
  const ButtonCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.width / 2.5,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 213, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
      ),
    );
  }
}
