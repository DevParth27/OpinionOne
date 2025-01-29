import 'package:event_user/models/predictions.dart';
import 'package:event_user/pages/UserPage.dart';
import 'package:event_user/pages/user_pages/predictionsdetails.dart';
import 'package:event_user/pages/walletPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(225.0),
        child: AppBar(
          toolbarHeight: 225,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 5),
                  // Conditionally show the title or search bar
                  if (!_isSearching)
                    const Text(
                      'Bartr Opinion',
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  if (_isSearching)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.white),
                          autofocus: true,
                          onSubmitted: (query) {
                            // Handle search submission
                            setState(() {
                              _isSearching = false;
                            });
                          },
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (!_isSearching)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearching = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  if (_isSearching)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isSearching = false;
                          _searchController.clear();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.transparent,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        icon: const Icon(Icons.notifications,
                            color: Colors.white),
                        onPressed: () {
                          // Add your notifications functionality here
                        },
                        iconSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child:
                    HorizontalCalendar(), // Assuming HorizontalCalendar is defined elsewhere
              ),
              const SizedBox(height: 11),
              const Row(
                children: [
                  SizedBox(width: 13),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ongoing Predictions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(
                height: 2,
                thickness: 1,
                color: Colors.grey[400],
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PredictionDetailsPage(
                              description:
                                  "Will India Win the 4th T20 Match against England?",
                              endDate: "05/02/2025",
                              participants: 112,
                              price: "2x",
                            ),
                          ),
                        );
                      },
                      child: const PredictionCard(
                        title: "Cricket Match Prediction",
                        description:
                            "Will India Win the 4th T20 Match against England?",
                        endDate: "05/02/2025",
                        participants: '112',
                        price: "2x Money",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
                    color: Colors.white.withOpacity(0.5), // Adjust opacity here
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
    );
  }

  // final List<Widget> _pages = [
  //   const HomePage(),
  //   const HomePage(),
  //   const HomePage(),
  //   const SettingPage(),
  // ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.wallet,
    Icons.bookmark_rounded,
    Icons.person_outline_rounded,
  ];
}

class HorizontalCalendar extends StatelessWidget {
  final List<DateTime> dates = List.generate(
    5,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dates.length,
      itemBuilder: (context, index) {
        return DateTile(date: dates[index]);
      },
    );
  }
}

class DateTile extends StatelessWidget {
  final DateTime date;
  const DateTile({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(6.5),
            decoration: BoxDecoration(
              color: Colors.transparent, // Transparent background for day name
              borderRadius: BorderRadius.circular(10), // Circular shape
            ),
            child: Text(
              _getDayName(date.weekday), // Display day name
              style: TextStyle(
                color: Colors.grey[400], // Day name color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4), // Add some spacing
          Container(
            padding: const EdgeInsets.all(6.5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                  255, 20, 20, 20), // Grey background for date
              borderRadius: BorderRadius.circular(10), // Circular shape
            ),
            child: Text(
              '${date.day}',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white, // Date color
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'MON';
      case DateTime.tuesday:
        return 'TUE';
      case DateTime.wednesday:
        return 'WED';
      case DateTime.thursday:
        return 'THU';
      case DateTime.friday:
        return 'FRI';
      case DateTime.saturday:
        return 'SAT';
      case DateTime.sunday:
        return 'SUN';
      default:
        return '';
    }
  }
}
