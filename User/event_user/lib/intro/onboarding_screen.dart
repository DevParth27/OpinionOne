import 'package:event_user/auth/login_user.dart';
import 'package:event_user/intro/intro_page1.dart';
import 'package:event_user/intro/intro_page2.dart';
import 'package:event_user/intro/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  //last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 68, 66, 66),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color.fromARGB(255, 78, 82, 82)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.cyan[200],
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      _controller.jumpToPage(2);
                    }),
                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done
                onLastPage
                    ? GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 68, 66, 66),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: const Color.fromARGB(255, 78, 82, 82)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.cyan[200],
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        },
                      )
                    : GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 68, 66, 66),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: const Color.fromARGB(255, 78, 82, 82)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.cyan[200],
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
