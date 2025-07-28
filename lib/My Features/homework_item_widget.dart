import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeworkItemWidget extends StatelessWidget {
  final String subject;
  final String date;
  final String lesson;
  final String upcomingLesson;
  final String homeworkDescription;
  final bool isSubmitted;
  final bool isCorrected;
  final String feedback;

  const HomeworkItemWidget({
    super.key,
    required this.subject,
    required this.date,
    required this.lesson,
    required this.upcomingLesson,
    required this.homeworkDescription,
    this.isSubmitted = false,
    this.isCorrected = false,
    this.feedback = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.grid_view, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(lesson),
            const SizedBox(height: 4),
            Text(upcomingLesson),
            const SizedBox(height: 4),
            Text(homeworkDescription),
            const SizedBox(height: 12),
            Row(
              children: [
                Chip(
                  label: Text(
                    isSubmitted ? 'Submitted' : 'Not Submitted',
                    style: TextStyle(color: isSubmitted ? Colors.white : Colors.black),
                  ),
                  backgroundColor: isSubmitted ? Colors.green : Colors.grey[300],
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    isCorrected ? 'Corrected' : 'Not Corrected',
                    style: TextStyle(color: isCorrected ? Colors.white : Colors.black),
                  ),
                  backgroundColor: isCorrected ? Colors.blue : Colors.grey[300],
                ),
              ],
            ),
            if (feedback.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('Feedback: $feedback'),
            ],
          ],
        ),
      ),
    );
  }
}
