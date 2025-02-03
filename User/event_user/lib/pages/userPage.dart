import 'dart:io';

import 'package:event_user/models/logout_item.dart';
import 'package:event_user/models/settings_item.dart';
import 'package:event_user/pages/homepage.dart';
import 'package:event_user/pages/user_pages/aboutus.dart';
import 'package:event_user/pages/user_pages/edit_profile.dart';
import 'package:event_user/pages/user_pages/helpNsupport.dart';
import 'package:event_user/pages/user_pages/upgrade_membership_screen.dart';
import 'package:event_user/pages/walletPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? _firstName;
  String? _lastName;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('firstName');
      _lastName = prefs.getString('lastName');
      _imagePath = prefs.getString('imagePath');
    });
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          shadowColor: Colors.grey[900],
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white),
            onPressed: () {
              // Navigate to home page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          backgroundColor: Colors.grey[900],
          title: const Text(
            '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                ClipOval(
                  child: _imagePath == null
                      ? Container(
                          width: 120,
                          height: 120,
                          color: Colors.grey[400],
                          child: const Icon(Icons.person, size: 120),
                        )
                      : Image.file(
                          File(_imagePath!),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 22),
                Text(
                  "Welcome, ${_firstName != null && _lastName != null ? ' $_firstName $_lastName' : ' User'}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                    _loadProfileData(); // Reload profile data after editing
                  },
                  child: Container(
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Divider(
                  height: 1.5,
                  thickness: 1,
                  color: Colors.grey[400],
                  indent: 10, // Left padding
                  endIndent: 10, // Right padding
                ),
                const SizedBox(height: 5),
                Expanded(
                  flex: 1,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    children: [
                      // SettingsItem(
                      //   icon: Icons.event,
                      //   title: 'Manage Events',
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const ManageEventsPage(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      // SettingsItem(
                      //   icon: Icons.online_prediction_rounded,
                      //   title: 'Confirmation History',
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => BookingHistoryPage(),
                      //       ),
                      //     );
                      //   },
                      // ),
                      SettingsItem(
                        icon: Icons.card_giftcard,
                        title: 'Upgrade Membership',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TradingDetailsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsItem(
                        icon: Icons.info,
                        title: 'About Us',
                        onTap: () {
                          // Implement about us screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        height: 1.5,
                        thickness: 1,
                        color: Colors.grey[400],
                        indent: 10, // Left padding
                        endIndent: 10, // Right padding
                      ),
                      const SizedBox(height: 15),
                      SettingsItem(
                        icon: Icons.feedback,
                        title: 'Help & Support',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HelpAndSupportPage(),
                            ),
                          );
                        },
                      ),
                      LogoutItem(context: context),
                      const SizedBox(height: 84),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Copyright © 2025. All rights reserved.',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05), // Adjust opacity here
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
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
                if (index == 1) {
                  // Check if the settings icon is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WalletPage()),
                  );
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
                if (index == 2) {
                  // Check if the settings icon is clicked
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const UserPage()),
                  // );
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
                if (index == 3) {
                  // Check if the settings icon is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
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
                      color:
                          Colors.white.withOpacity(0.5), // Adjust opacity here
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? Colors.white
                        : const Color.fromARGB(95, 137, 133, 133),
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.wallet,
    Icons.bookmark_rounded,
    Icons.person_outline_rounded,
  ];
}
