import 'package:flutter/material.dart';

import 'home_work_page.dart';
import 'homework_item_widget.dart';

class HomeworkHistoryPage extends StatefulWidget {
  const HomeworkHistoryPage({super.key});

  @override
  State<HomeworkHistoryPage> createState() => _HomeworkHistoryPageState();
}

class _HomeworkHistoryPageState extends State<HomeworkHistoryPage> {
  String? _selectedDate; // Selected date
  String? _selectedFilter = 'All'; // Selected filter (default All)

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date current date
      firstDate: DateTime(2000), // First selectable date
      lastDate: DateTime(2101), // Last selectable date
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.day}/${picked.month}/${picked.year}"; // Date format set kora holo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
        title: const Text('homework'), // AppBar title
        centerTitle: true, // Title center-e rakha holo
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10), // TabBar er height adjust kora holo
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding add kora holo
            child: Container(
              height: 45, // Tab bar container height
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color
                borderRadius: BorderRadius.circular(25.0), // Rounded corners
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Dairy tab e click korle HomeworkPage e navigate kora holo
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeworkPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0), // Rounded corners
                          // color: Colors.grey[200], // Unselected color
                        ),
                        alignment: Alignment.center, // Text center-e rakha holo
                        child: const Text(
                          'Dairy', // Dairy tab text
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0), // Rounded corners
                        color: Colors.blue[700], // Selected color
                      ),
                      alignment: Alignment.center, // Text center-e rakha holo
                      child: const Text(
                        'History', // History tab text
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context), // Date picker open korar jonno
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Border
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDate ?? 'mm/dd/yyyy', // Selected date or placeholder
                              style: const TextStyle(fontSize: 16), // Text style
                            ),
                          ),
                          const Icon(Icons.calendar_today, size: 20), // Calendar icon
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Space
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12), // Padding
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedFilter, // Selected filter value
                        icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
                        iconSize: 24, // Icon size
                        elevation: 16, // Elevation
                        style: const TextStyle(color: Colors.black, fontSize: 16), // Text style
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFilter = newValue; // New value set kora holo
                          });
                        },
                        items: <String>['All', 'Submitted', 'Not Submitted', 'Corrected', 'Not Corrected']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value), // Dropdown item text
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Listview padding
              children: const [
                HomeworkItemWidget(
                  subject: 'বিষয়: গণিত', // Subject
                  date: 'তারিখ: ০২-০৩-২০২৩', // Date
                  lesson: 'আজকের পাঠ: ল.সা.গু ও গ.সা.গু', // Today's lesson
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: অনুশীলনী ৫.১', // Tomorrow's preparation
                  homeworkDescription: 'হোমওয়ার্ক: ১০টি সমস্যা সমাধান', // Homework description
                  isSubmitted: true, // Submitted
                  isCorrected: false, // Not corrected
                  feedback: '', // No feedback
                ),
                SizedBox(height: 16), // Space between items
                HomeworkItemWidget(
                  subject: 'বিষয়: বিজ্ঞান', // Subject
                  date: 'তারিখ: ০২-০৩-২০২৩', // Date
                  lesson: 'আজকের পাঠ: জীব কোষ', // Today's lesson
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: ডায়াগ্রাম আঁকা', // Tomorrow's preparation
                  homeworkDescription: 'হোমওয়ার্ক: ১০টি সমস্যা সমাধান', // Homework description
                  isSubmitted: false, // Not submitted
                  isCorrected: false, // Not corrected
                  feedback: 'খারাপ', // Feedback
                ),
                SizedBox(height: 16),
                HomeworkItemWidget(
                  subject: 'বিষয়: বাংলা', // Subject
                  date: 'তারিখ: ০২-০৩-২০২৩', // Date
                  lesson: 'আজকের পাঠ: কবিতা', // Today's lesson
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: ব্যাকরণ', // Tomorrow's preparation
                  homeworkDescription: 'হোমওয়ার্ক: ৫টি বাক্য রচনা', // Homework description
                  isSubmitted: true, // Submitted
                  isCorrected: true, // Corrected
                  feedback: 'ভাল', // Feedback
                ),
                SizedBox(height: 16),
                HomeworkItemWidget(
                  subject: 'বিষয়: ইংরেজি', // Subject
                  date: 'তারিখ: ০২-০৩-২০২৩', // Date
                  lesson: 'আজকের পাঠ: গ্রামার', // Today's lesson
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: রাইটিং', // Tomorrow's preparation
                  homeworkDescription: 'হোমওয়ার্ক: একটি অনুচ্ছেদ লেখা', // Homework description
                  isSubmitted: true, // Submitted
                  isCorrected: true, // Corrected
                  feedback: 'খুব ভাল', // Feedback
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed type for items
        selectedItemColor: Colors.blue[700], // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        backgroundColor: Colors.white, // Bottom navigation bar background white
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'HOME', // Home label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox), // Inbox icon
            label: 'INBOX', // Inbox label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz), // Transaction icon
            label: 'TRANSACTION', // Transaction label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Profile icon
            label: 'PROFILE', // Profile label
          ),
        ],
      ),
    );
  }
}