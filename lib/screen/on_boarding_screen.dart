import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlineshopapp/screen/mainscreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _scrollerPosition = 0;
  final _totalDots = 5;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            PageView(
                onPageChanged: (value) {
                  setState(() {
                    _scrollerPosition = value;
                  });
                },
                children: [
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Wel Come\n To Shop App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          "+100 Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: Image.asset("assets/images/2.png"),
                        ),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Safe & Secure",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          "Payment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/3.png"),
                        ),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Wel Come\n To Shop App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          "+100 Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/4.png"),
                        ),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Wel Come\n To Shop App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          "+100 Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/5.png"),
                        ),
                      ],
                    ),
                  ),
                  OnBoardPage(
                    boardColumn: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Wel Come\n To Shop App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        Text(
                          "+100 Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset("assets/images/1.png"),
                        ),
                      ],
                    ),
                  ),
                ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DotsIndicator(
                    dotsCount: _totalDots,
                    position: _scrollerPosition,
                    axis: Axis.horizontal,
                    // reversed: true,
                    decorator: DotsDecorator(
                      activeColor: Colors.white,
                    ),
                  ),
                  _scrollerPosition == 4
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ));
                            },
                            child: Text("Stare Shopping"),
                          ),
                        )
                      : TextButton(
                          onPressed: () {},
                          child: Text(
                            "SKIP TO THE APP >",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? boardColumn;
  const OnBoardPage({Key? key, this.boardColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.teal,
          child: Center(child: boardColumn),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.blueGrey[600],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                topLeft: Radius.circular(100),
              ),
            ),
          ),
        )
      ],
    );
  }
}
