import 'package:flutter/material.dart';

import 'home_work_page.dart';
import 'homework_item_widget.dart';

class HomeworkHistoryPage extends StatefulWidget {
  const HomeworkHistoryPage({super.key});

  @override
  State<HomeworkHistoryPage> createState() => _HomeworkHistoryPageState();
}

class _HomeworkHistoryPageState extends State<HomeworkHistoryPage> {
  String? _selectedDate;
  String? _selectedFilter = 'All';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeworkPage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Dairy',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.blue[700],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'History',
                        style: TextStyle(color: Colors.white),
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedDate ?? 'mm/dd/yyyy',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const Icon(Icons.calendar_today, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedFilter,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFilter = newValue;
                          });
                        },
                        items: <String>['All', 'Submitted', 'Not Submitted', 'Corrected', 'Not Corrected']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                HomeworkItemWidget(
                  subject: 'বিষয়: গণিত',
                  date: 'তারিখ: ০২-০৩-২০২৩',
                  lesson: 'আজকের পাঠ: ল.সা.গু ও গ.সা.গু',
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: অনুশীলনী ৫.১',
                  homeworkDescription: 'হোমওয়ার্ক: ১০টি সমস্যা সমাধান',
                  isSubmitted: true,
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
                  feedback: 'খারাপ',
                ),
                SizedBox(height: 16),
                HomeworkItemWidget(
                  subject: 'বিষয়: বাংলা',
                  date: 'তারিখ: ০২-০৩-২০২৩',
                  lesson: 'আজকের পাঠ: কবিতা',
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: ব্যাকরণ',
                  homeworkDescription: 'হোমওয়ার্ক: ৫টি বাক্য রচনা',
                  isSubmitted: true,
                  isCorrected: true,
                  feedback: 'ভাল',
                ),
                SizedBox(height: 16),
                HomeworkItemWidget(
                  subject: 'বিষয়: ইংরেজি',
                  date: 'তারিখ: ০২-০৩-২০২৩',
                  lesson: 'আজকের পাঠ: গ্রামার',
                  upcomingLesson: 'আগামীকালের প্রস্তুতি: রাইটিং',
                  homeworkDescription: 'হোমওয়ার্ক: একটি অনুচ্ছেদ লেখা',
                  isSubmitted: true,
                  isCorrected: true,
                  feedback: 'খুব ভাল',
                ),
              ],
            ),
          ),
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
