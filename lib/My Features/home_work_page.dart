import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homework_history_page.dart';
import 'homework_item_widget.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Back button functionality
          },
        ),
        title: const Text('homework'),
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.blue[700],
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'Dairy'),
                  Tab(text: 'History'),
                ],
                onTap: (index) {
                  if (index == 1) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeworkHistoryPage()),
                    ).then((_) {

                      _tabController.animateTo(0);
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [

          ListView(
            padding: const EdgeInsets.all(16.0),
            children: const [
              HomeworkItemWidget(
                subject: 'বিষয়: গণিত',
                date: 'তারিখ: ০২-০৩-২০২৩',
                lesson: 'আজকের পাঠ: ল.সা.গু ও গ.সা.গু',
                upcomingLesson: 'আগামীকালের প্রস্তুতি: অনুশীলনী ৫.১',
                homeworkDescription: 'হোমওয়ার্ক: ১০টি সমস্যা সমাধান',
                isSubmitted: false,
                isCorrected: false,
                feedback: '',
              ),
              SizedBox(height: 16),
              HomeworkItemWidget(
                subject: 'বিষয়: বিজ্ঞান',
                date: 'তারিখ: ০২-০৩-২০২৩',
                lesson: 'আজকের পাঠ: জীব কোষ',
                upcomingLesson: 'আগামীকালের প্রস্তুতি: ডায়াগ্রাম আঁকা',
                homeworkDescription: 'হোমওয়ার্ক: ১০টি সমস্যা সমাধান',
                isSubmitted: false,
                isCorrected: false,
                feedback: '',
              ),
              SizedBox(height: 16),
              HomeworkItemWidget(
                subject: 'বিষয়: বাংলা',
                date: 'তারিখ: ০২-০৩-২০২৩',
                lesson: 'আজকের পাঠ: কবিতা',
                upcomingLesson: 'আগামীকালের প্রস্তুতি: ব্যাকরণ',
                homeworkDescription: 'হোমওয়ার্ক: ৫টি বাক্য রচনা',
                isSubmitted: false,
                isCorrected: false,
                feedback: '',
              ),
              SizedBox(height: 16),
              HomeworkItemWidget(
                subject: 'বিষয়: ইংরেজি',
                date: 'তারিখ: ০২-০৩-২০২৩',
                lesson: 'আজকের পাঠ: গ্রামার',
                upcomingLesson: 'আগামীকালের প্রস্তুতি: রাইটিং',
                homeworkDescription: 'হোমওয়ার্ক: একটি অনুচ্ছেদ লেখা',
                isSubmitted: false,
                isCorrected: false,
                feedback: '',
              ),
            ],
          ),

          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'INBOX',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'TRANSACTION',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}