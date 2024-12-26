import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tms/authority/author.dart';
import 'package:tms/pages/allocation.dart';
import 'package:tms/pages/others.dart';
import 'package:tms/pages/return.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of page routes
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Homepage(),
    const Allocation(),
    const Return(),
    const Others(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Navigate to the page associated with the tapped index
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  String dropdownvalue = 'BOT';
  bool isExpanded = false; // To track if the container is expanded

  var items = [
    'BOT',
    'Bohaddarhat mor',
    'Muradpur',
    '2No gate',
    'Sher shah',
    'ChawkBazar',
    'GEC',
    'Halisohor',
    'Baroyar Hut',
    'Agrabad',
    'Miros sorai',
    'Oxygen',
    'Hathajahri',
    'Bor Dhigir par',
  ];

  @override
  Widget build(BuildContext context) {
    // Get the width and height of the screen
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // App bar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),//changes the colour of the drawers 3 bar icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "hola! good people",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.admin_panel_settings,color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Author()));
              },
            ),
          ],
        ),
        backgroundColor: Colors.purple.shade300,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple.shade300,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/ff.jpg'), // Profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Fahim ul huq",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ID: C2223110",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("View Profile"),
              onTap: () {
                // Navigate to View Profile screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profile"),
              onTap: () {
                // Navigate to Edit Profile screen
                Navigator.pop(context); //closes the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.bus_alert_sharp),
              title: const Text("Update Transport"),
              onTap: () {
                // Navigate to Courses screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_gas_station),
              title: const Text("Select Station"),
              onTap: () {
                // Navigate to Courses screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Handle logout functionality
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Where Are You Now?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: screenWidth * 0.8, // 80% of the screen width
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.purple.shade50,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true, // Ensures dropdown expands to match width
                  value: dropdownvalue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.purple[300],
                  ),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      //it will route to a new page where the seleceted place related all the routes will be shown
                      //and the available bus on the roads
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Return()));
                    });
                  },
                  dropdownColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded; // Toggle the container size
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: screenWidth * 0.8,
                height: isExpanded ? screenHeight * 0.6 : 100,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.purple.shade50,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Field for live bus tracking will be added later",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (!isExpanded)
                      const Icon(
                        Icons.expand_more,
                        color: Colors.purple,
                        size: 30,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex, // Keep track of the selected index
            onTap: _onItemTapped, // Handle navigation
            backgroundColor: Colors.purple.withOpacity(0.6),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            elevation: 2,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined),
                activeIcon: Icon(Icons.map),
                label: 'Track',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handyman_outlined),
                activeIcon: Icon(Icons.handyman),
                label: 'Allocation',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.keyboard_return_outlined),
                activeIcon: Icon(Icons.keyboard_return),
                label: 'Return',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps_outlined),
                activeIcon: Icon(Icons.apps),
                label: 'Others',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
