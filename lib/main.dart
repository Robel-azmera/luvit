import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/screens/home.dart';

import 'firebase_options.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> _widgetOptions = <Widget>[
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 11, 11),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        leadingWidth: 35,
        leading: SvgPicture.asset(
          'assets/icons/loca.svg',
        ),
        titleSpacing: 0,
        title: const Text(
          '목이길어슬픈기린님의 새로운 스팟',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.only(right: 7, left: 7),
            decoration: BoxDecoration(
              border: Border.all(width: 0.15, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              SvgPicture.asset('assets/icons/notifystar.svg'),
              const SizedBox(
                width: 5,
              ),
              const Text('324,276'),
            ]),
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/notification.svg'),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            width: 150,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        elevation: 5.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          color:
                              _selectedIndex == 0 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          '홈',
                          style: TextStyle(
                            color:
                                _selectedIndex == 0 ? Colors.pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _onItemTapped(1);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          color:
                              _selectedIndex == 1 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          '홈',
                          style: TextStyle(
                            color:
                                _selectedIndex == 1 ? Colors.pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/message.svg',
                          color:
                              _selectedIndex == 2 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          '채팅',
                          style: TextStyle(
                            color:
                                _selectedIndex == 2 ? Colors.pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      _onItemTapped(3);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/profile.svg',
                          color:
                              _selectedIndex == 3 ? Colors.pink : Colors.grey,
                        ),
                        Text(
                          '마이',
                          style: TextStyle(
                            color:
                                _selectedIndex == 3 ? Colors.pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
