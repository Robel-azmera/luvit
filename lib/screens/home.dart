import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/unicorn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg',
    'assets/images/1.jpg',
  ];
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          height: size.height * 0.85,
          child: CarouselSlider(
            items: imgList
                .map((item) => Container(
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.15, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: size.width * 0.88,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                autoPlay: false,
                height: size.height * 0.85,
                enlargeFactor: 1.0,
                initialPage: 0,
                viewportFraction: 1.3,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                aspectRatio: 0.8,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                }),
          ),
        ),
        Center(
          child: Container(
            margin:
                EdgeInsets.only(left: 0, right: 0, top: size.height * 0.035),
            child: AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: imgList.length,
              effect: const SlideEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 55,
                dotHeight: 2.5,
                dotColor: Color.fromARGB(255, 28, 28, 28),
                activeDotColor: Colors.pink,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 150.0,
          right: 100.0,
          left: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/icons/blackstar.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '324,276',
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: UnicornOutlineButton(
                  strokeWidth: 1,
                  radius: 35,
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 95, 173, 238),
                    Colors.white
                  ]),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => const RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 2],
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 106, 175, 232),
                      ],
                    ).createShader(bounds),
                    child: SvgPicture.asset('assets/icons/blue.svg'),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}