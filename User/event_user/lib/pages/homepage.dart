import 'package:event_user/pages/settingsPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(225.0),
        child: AppBar(
          toolbarHeight: 225,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 5), // Adjust spacing
                  const Text(
                    'EventoFactor',
                    style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(), // Takes available space
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 20, 20, 20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // Add your search functionality here
                        },
                        iconSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Adjust spacing
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 20, 20, 20),
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
                  const SizedBox(width: 2), // Adjust spacing
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100, // Adjust height as needed
                child: HorizontalCalendar(),
              ),
              const SizedBox(
                height: 11,
              ),
              const Row(
                children: [
                  SizedBox(width: 13),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Discover Events',
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
                indent: 10, // Left padding
                endIndent: 10, // Right padding
              ), // Adjust spacing
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0, // Removes shadow
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
                Container(
                  height: 455,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/images/images_show/home_cards/card 1.jpg',
                          fit: BoxFit.cover,
                        ), // Replace with your image widget
                      ),
                      const SizedBox(
                          width: 20), // Add some spacing between image and text
                      // Text and dummy data take 1/4 of the card
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alan Walker Music',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '12 - 14 Mar 2024',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 50),
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  'Nagpur, India',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.person_outline,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  '+73.2K',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 150),
                                Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 77, 177),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        'Join',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 455,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/images/images_show/home_cards/card 1.jpg',
                          fit: BoxFit.cover,
                        ), // Replace with your image widget
                      ),
                      const SizedBox(
                          width: 20), // Add some spacing between image and text
                      // Text and dummy data take 1/4 of the card
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alan Walker Music',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '12 - 14 Mar 2024',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 50),
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  'Nagpur, India',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.person_outline,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  '+73.2K',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 150),
                                Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 77, 177),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        'Join',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 455,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/images/images_show/home_cards/card 1.jpg',
                          fit: BoxFit.cover,
                        ), // Replace with your image widget
                      ),
                      const SizedBox(
                          width: 20), // Add some spacing between image and text
                      // Text and dummy data take 1/4 of the card
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alan Walker Music',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '12 - 14 Mar 2024',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 50),
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  'Nagpur, India',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.person_outline,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  '+73.2K',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 150),
                                Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 77, 177),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        'Join',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 455,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 20, 20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'assets/images/images_show/home_cards/card 1.jpg',
                          fit: BoxFit.cover,
                        ), // Replace with your image widget
                      ),
                      const SizedBox(
                          width: 20), // Add some spacing between image and text
                      // Text and dummy data take 1/4 of the card
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alan Walker Music',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '12 - 14 Mar 2024',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 50),
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  'Nagpur, India',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.person_outline,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  '+73.2K',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(width: 150),
                                Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 102, 77, 177),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Center(
                                      child: Text(
                                        'Join',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
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
              if (index == 3) {
                // Check if the settings icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
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
    Icons.calendar_month_rounded,
    Icons.bookmark_rounded,
    Icons.settings_rounded,
  ];
}

class HorizontalCalendar extends StatelessWidget {
  final List<DateTime> dates = List.generate(
    6,
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
