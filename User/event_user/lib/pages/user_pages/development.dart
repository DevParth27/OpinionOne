import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/userPage.dart';
import 'package:event_user/pages/walletPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderDevelopmentPage extends StatefulWidget {
  const UnderDevelopmentPage({super.key});

  @override
  _UnderDevelopmentPageState createState() => _UnderDevelopmentPageState();
}

class _UnderDevelopmentPageState extends State<UnderDevelopmentPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    // Dummy function (implement logic if needed)
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bartr Opinion',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                const Icon(
                  Icons.trending_up,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                const Text('Page Under Development',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Stay tuned!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Exciting updates are coming soon.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Notify Me',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context, size),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, Size size) {
    List<IconData> listOfIcons = [
      Icons.home_rounded,
      Icons.wallet,
      Icons.bookmark_rounded,
      Icons.person_outline_rounded,
    ];

    List<Widget> pages = [
      const HomePage(),
      const WalletPage(),
      const UnderDevelopmentPage(),
      const UserPage(),
    ];

    return Container(
      margin: const EdgeInsets.all(20),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pages[index]),
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == currentIndex ? 0 : size.width * .029,
                  right: size.width * .0422,
                  left: size.width * .0422,
                ),
                width: size.width * .128,
                height: index == currentIndex ? size.width * .014 : 0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
              ),
              Icon(
                listOfIcons[index],
                size: size.width * .076,
                color: index == currentIndex ? Colors.white : Colors.grey,
              ),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
      ),
    );
  }
}
