import 'package:event_user/models/predictions.dart';
import 'package:event_user/pages/UserPage.dart';
import 'package:event_user/pages/user_pages/development.dart';
import 'package:event_user/pages/user_pages/predictionsdetails.dart';
import 'package:event_user/pages/walletPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool hasSeenDialog = prefs.getBool('hasSeenDialog') ?? false;

    if (!hasSeenDialog) {
      _showWelcomeDialog();
      prefs.setBool(
          'hasSeenDialog', true); // Set flag to prevent future dialogs
    }
  }

  void _showWelcomeDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Welcome to Bartr Opinion!"),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "• We are providing Demo Account To our valuable customers in which we are giving 1000 rs as a welcome Bonus."),
              SizedBox(height: 5),
              Text(
                  "• Please Update your profile as early as possible from Profile Section"),
              SizedBox(height: 5),
              Text("• Stay updated with real-time insights."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    });
  }

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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Rohit Sharma score a half-century in the 1st innings of the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 1468,
                          price: "3x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Rohit Sharma score a half-century in the 1st innings of the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '1468 traders',
                    price: "2x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Jasprit Bumrah take 5 or more wickets in the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 1197,
                          price: "1.5x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Jasprit Bumrah take 5 or more wickets in the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '1197 traders',
                    price: "5x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Joe Root score a century in the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 920,
                          price: "1.4x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Joe Root score a century in the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '920 traders',
                    price: "2.3x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Ravichandran Ashwin take 10 or more wickets in the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 850,
                          price: "1.8x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Ravichandran Ashwin take 10 or more wickets in the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '850 traders',
                    price: "2x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will India win the 5th Test against England by an innings margin?",
                          endDate: "05/02/2025",
                          participants: 1100,
                          price: "1.2x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will India win the 5th Test against England by an innings margin?",
                    endDate: "05/02/2025",
                    participants: '1100 traders',
                    price: "1.3x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Ben Stokes hit 6 or more sixes in the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 780,
                          price: "1.9x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Ben Stokes hit 6 or more sixes in the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '780 traders',
                    price: "2.4x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Virat Kohli score a double century in the 5th Test between India and England?",
                          endDate: "05/02/2025",
                          participants: 950,
                          price: "1.3x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Virat Kohli score a double century in the 5th Test between India and England?",
                    endDate: "05/02/2025",
                    participants: '950 traders',
                    price: "2.2x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will England's openers score a 100+ partnership in the 1st innings of the 5th Test?",
                          endDate: "05/02/2025",
                          participants: 670,
                          price: "3.2x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will England's openers score a 100+ partnership in the 1st innings of the 5th Test?",
                    endDate: "05/02/2025",
                    participants: '670 traders',
                    price: "2.1x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will India's top 3 batsmen score 200+ runs collectively in the 1st innings of the 5th Test?",
                          endDate: "05/02/2025",
                          participants: 720,
                          price: "2x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will India's top 3 batsmen score 200+ runs collectively in the 1st innings of the 5th Test?",
                    endDate: "05/02/2025",
                    participants: '720 traders',
                    price: "2.2x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will James Anderson take 4 or more wickets in the 1st innings of the 5th Test?",
                          endDate: "05/02/2025",
                          participants: 640,
                          price: "1.2x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will James Anderson take 4 or more wickets in the 1st innings of the 5th Test?",
                    endDate: "05/02/2025",
                    participants: '640 traders',
                    price: "1x",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PredictionDetailsPage(
                          description:
                              "Will Rishabh Pant hit 3 or more sixes in the 1st innings of the 5th Test?",
                          endDate: "05/02/2025",
                          participants: 580,
                          price: "3.2x",
                        ),
                      ),
                    );
                  },
                  child: const PredictionCard(
                    title: "Cricket Prediction",
                    description:
                        "Will Rishabh Pant hit 3 or more sixes in the 1st innings of the 5th Test?",
                    endDate: "05/02/2025",
                    participants: '580 traders',
                    price: "1.2x",
                  ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UnderDevelopmentPage()),
                );
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
