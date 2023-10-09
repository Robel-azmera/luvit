import 'dart:math';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/unicorn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;
  final ref = FirebaseDatabase.instance.ref().child('data');
  contr(index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  Map<String, Object?> datas = {};
  @override
  void initState() {
    if (datas.isEmpty) {
      print("INNNNNNNN");

      datas = {
        "apple": {
          "age": 25,
          "description": "",
          "images": [
            "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a29yZWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
          ],
          "likeCount": 29930,
          "location": "2km 거리에 있음",
          "name": "잭과분홍콩나물",
          "tags": [""]
        },
        "banana": {
          "age": 25,
          "description":
              "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
          "images": [
            "https://images.unsplash.com/photo-1535704882196-765e5fc62a53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8a29yZWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
            "https://cdn.britannica.com/92/13192-050-6644F8C3/bananas-bunch.jpg?w=400&h=300&c=crop",
            "https://res.cloudinary.com/roundglass/image/upload/v1653327652/rg/collective/media/Banana%20KP_yg3asc.png",
            "https://www.thedailymeal.com/img/gallery/13-delicious-things-you-can-make-with-bananas/intro-1673458653.sm.webp"
          ],
          "likeCount": 29930,
          "location": "",
          "name": "잭과분홍콩나물",
          "tags": [""]
        },
        "melon": {
          "age": 25,
          "description": "",
          "images": [
            "https://img.freepik.com/premium-photo/portrait-beautiful-women_825367-156.jpg",
            "https://www.agroponiente.com/wp-content/uploads/2021/09/sandia-snack-Kisy-Agroponiente.png",
          ],
          "likeCount": 29930,
          "location": "",
          "name": "잭과분홍콩나물",
          "tags": ["매일 1시간 이상", "비흡연", "전혀 안 함", "ENFP"]
        },
        "peach": {
          "age": 25,
          "description": "",
          "images": [
            "https://w0.peakpx.com/wallpaper/142/358/HD-wallpaper-korean-girl-beautiful-julie-yang-beautiful-korean-julie-yang-beautiful-korean.jpg",
            "https://www.agroponiente.com/wp-content/uploads/2021/09/sandia-snack-Kisy-Agroponiente.png",
          ],
          "likeCount": 29930,
          "location": "",
          "name": "잭과분홍콩나물",
          "tags": ["매일 1시간 이상", "비흡연", "전혀 안 함", "ENFP"]
        },
        "watermelon": {
          "age": 25,
          "description": "",
          "images": [
            "https://img.freepik.com/premium-photo/sporty-blonde-korean-girl-gym-gym-clothes_996930-197.jpg",
            "https://www.agroponiente.com/wp-content/uploads/2021/09/sandia-snack-Kisy-Agroponiente.png",
          ],
          "likeCount": 29930,
          "location": "",
          "name": "잭과분홍콩나물",
          "tags": ["매일 1시간 이상", "비흡연", "전혀 안 함", "ENFP"]
        },
      };
      FirebaseDatabase.instance
          .ref()
          .child('data')
          .update(datas)
          .then((value) => {});
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<dynamic> data = [];
    print(datas.length);
    return Container(
      height: size.height * 0.9,
      width: size.height * 0.8,
      child: FirebaseAnimatedList(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, snapshot, animation, index) {
          Map person = snapshot.value as Map;
          data.add(person);
          return person.isEmpty
              ? Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.3, left: 25, right: 25),
                        child: Column(
                          children: const [
                            Text(
                              "추천 드릴 친구들을 준비 중이에요",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "매일 새로운 친구들을 소개시켜",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    height: size.height * 0.85,
                    child: Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.15, color: Colors.grey),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Image.network(
                                data[index]['images'][0],
                                fit: BoxFit.cover,
                                height: size.height * 1.5,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: size.width * 0.1,
                          right: size.width * 0.07,
                          child: Container(
                            child: Column(
                              children: [
                                Positioned(
                                  bottom: size.height * 0.2,
                                  right: size.width * 0.1,
                                  left: size.width * 0.1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 100,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 7),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                              Text(
                                                '${data[index]['likeCount'].toString()}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.03,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 50.0,
                                  right: 0.0,
                                  left: 0.0,
                                  child: Row(
                                    children: [
                                      Text(
                                        data[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        data[index]['age'].toString() == ""
                                            ? ""
                                            : "${data[index]['age'].toString()}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                  bottom: 50.0,
                                  right: 0.0,
                                  left: 0.0,
                                  child: Text(
                                    data[index]['location'].toString() == ""
                                        ? ""
                                        : "${data[index]['location'].toString()}",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                  bottom: 50.0,
                                  right: 0.0,
                                  left: 0.0,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      data[index]['description'].toString() ==
                                              ""
                                          ? ""
                                          : "${data[index]['description']}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                data[index]['tags'][0] != ""
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Positioned(
                                                bottom: size.height * 0.2,
                                                right: size.width * 0.9,
                                                left: size.width * 0.1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 7,
                                                                  vertical: 7),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Row(children: [
                                                            Image.asset(
                                                              'assets/icons/1.png',
                                                              width: 20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              '${data[index]['tags'][0]}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Positioned(
                                                bottom: size.height * 0.2,
                                                right: size.width * 0.1,
                                                left: size.width * 0.1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 7,
                                                                  vertical: 7),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Row(children: [
                                                            Image.asset(
                                                              'assets/icons/1.png',
                                                              width: 20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              '${data[index]['tags'][2]}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Positioned(
                                                bottom: size.height * 0.2,
                                                right: size.width * 0.1,
                                                left: size.width * 0.1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 7,
                                                                  vertical: 7),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Row(children: [
                                                            Image.asset(
                                                              'assets/icons/2.png',
                                                              width: 20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              '${data[index]['tags'][0]}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 0,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 7,
                                                        vertical: 7),
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/2.png',
                                                      width: 20,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      '${data[index]['tags'][1]}',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        child: SvgPicture.asset(
                                          'assets/icons/icon_20.svg',
                                          width: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.175,
                                    ),
                                    Container(
                                      child: Align(
                                        child: UnicornOutlineButton(
                                          strokeWidth: 1.25,
                                          radius: 30,
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color.fromARGB(255, 95, 173, 238),
                                            Colors.white
                                          ]),
                                          child: ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                const RadialGradient(
                                              center: Alignment.topCenter,
                                              stops: [.5, 2],
                                              colors: [
                                                Colors.white,
                                                Color.fromARGB(
                                                    255, 106, 175, 232),
                                              ],
                                            ).createShader(bounds),
                                            child: SvgPicture.asset(
                                              'assets/icons/blue.svg',
                                              width: 37,
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: size.width * 0.12),
                          child: AnimatedSmoothIndicator(
                            activeIndex: index,
                            count: datas.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.pink,
                              dotWidth: 35,
                              dotHeight: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
        query: ref,
      ),
    );
  }
}
