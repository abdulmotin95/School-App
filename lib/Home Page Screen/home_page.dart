import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../My Features/assignment_page.dart';
import '../My Features/attendace_page.dart';
import '../My Features/event_page.dart';
import '../My Features/exam_page.dart';
import '../My Features/fee_page.dart';
import '../My Features/home_work_page.dart';
import '../My Features/notice_page.dart';
import '../My Features/result_page.dart';
import '../My Features/timetable_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.1),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: Colors.orange[200],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/c.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // User Info
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mahin Talukder',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Class: 10 - Science | Roll No: 22',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          // Notification Icon
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey[700],
              size: 28,
            ),
            onPressed: () {
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/c.png'),
                      fit: BoxFit.none,
                      alignment: Alignment.bottomRight,
                      scale: 1,
                    ),


                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Share with',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const Text(
                              'friends',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Help your friends fall in love\nwith learning through Bviu\'s!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // My Features section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'My Features',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Grid of feature buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0,
                children: [
                  _buildFeatureButton(
                    Icons.calendar_today,
                    'Attendance',
                    Colors.blue[100]!,
                    Colors.blue[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendancePage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.assignment,
                    'Homework',
                    Colors.green[100]!,
                    Colors.green[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeworkPage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.access_time,
                    'Timetable',
                    Colors.orange[100]!,
                    Colors.orange[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimetablePage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.description,
                    'Assignment',
                    Colors.red[100]!,
                    Colors.red[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AssignmentPage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.menu_book,
                    'Exam',
                    Colors.deepPurple[100]!,
                    Colors.deepPurple[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExamPage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.checklist,
                    'Result',
                    Colors.purple[100]!,
                    Colors.purple[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultPage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.account_balance_wallet,
                    'Education Fee',
                    Colors.yellow[100]!,
                    Colors.yellow[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeePage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.notifications_active,
                    'Notice',
                    Colors.lightBlue[100]!,
                    Colors.lightBlue[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NoticePage()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    Icons.event,
                    'Event',
                    Colors.cyan[100]!,
                    Colors.cyan[700]!,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EventPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Apply for leaves button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.send), // Send icon
                    Text('Apply for leaves', style: TextStyle(fontSize: 18)),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'INBOX',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            activeIcon: Icon(Icons.credit_card),
            label: 'TRANSACTION',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),

    );
  }

  // Common function for feature buttons
  Widget _buildFeatureButton(IconData icon,
      String label,
      Color bgColor,
      Color iconColor,
      VoidCallback onTap, // new onTap parameter
      ) {
    return InkWell(
      onTap: onTap, // navigation here
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
