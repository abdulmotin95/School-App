import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeworkItemWidget extends StatelessWidget {
  final String subject; // Subject
  final String date; // Date
  final String lesson; // Today's lesson
  final String upcomingLesson; // Tomorrow's preparation
  final String homeworkDescription; // Homework description
  final bool isSubmitted; // Is homework submitted?
  final bool isCorrected; // Is homework corrected?
  final String feedback; // Feedback text

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
      elevation: 2, // Card er shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Card er rounded corners
      ),
      color: Colors.white, // Card background white kora holo
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Card er inner padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Left align content
          children: [
            Row(
              children: [
                Container(
                  width: 40, // Icon container width
                  height: 40, // Icon container height
                  decoration: BoxDecoration(
                    color: Colors.blue[100], // Background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: const Icon(Icons.grid_view, color: Colors.blue), // Icon
                ),
                const SizedBox(width: 12), // Space
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Left align content
                  children: [
                    Text(
                      subject, // Subject text
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 16, // Font size
                      ),
                    ),
                    Text(
                      date, // Date text
                      style: TextStyle(
                        color: Colors.grey[600], // Grey text color
                        fontSize: 14, // Font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 24), // Divider
            _buildInfoRow(Icons.book, lesson), // Lesson info row
            const SizedBox(height: 8), // Space
            _buildInfoRow(Icons.lightbulb_outline, upcomingLesson), // Upcoming lesson info row
            const SizedBox(height: 8), // Space
            _buildInfoRow(Icons.assignment, homeworkDescription), // Homework description info row
            if (isSubmitted || isCorrected || feedback.isNotEmpty)
              const Divider(height: 24), // Divider if status exists
            if (isSubmitted)
              _buildStatusRow(
                Icons.check_circle, // Check icon
                'হোমওয়ার্ক জমা দিয়েছে', // Submitted text
                Colors.green, // Green color
              ),
            if (!isSubmitted && feedback.isNotEmpty) // Only show if not submitted but has feedback (meaning not submitted, but teacher still gave feedback)
              _buildStatusRow(
                Icons.cancel, // Cancel icon
                'হোমওয়ার্ক জমা দেয়নি', // Not submitted text
                Colors.red, // Red color
              ),
            if (isCorrected)
              _buildStatusRow(
                Icons.check_circle, // Check icon
                'শিক্ষক স্বাক্ষর করেছেন', // Teacher corrected text
                Colors.green, // Green color
              ),
            if (!isCorrected && feedback.isNotEmpty) // Only show if not corrected but has feedback (meaning not corrected by teacher)
              _buildStatusRow(
                Icons.cancel, // Cancel icon
                'শিক্ষক স্বাক্ষর করেননি', // Teacher not corrected text
                Colors.red, // Red color
              ),
            if (feedback.isNotEmpty)
              _buildStatusRow(
                Icons.comment, // Comment icon
                'পারফরম্যান্স: $feedback', // Feedback text
                Colors.black, // Black color
              ),
          ],
        ),
      ),
    );
  }

  // Helper method to build info rows
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[600], size: 20), // Icon
        const SizedBox(width: 8), // Space
        Expanded(
          child: Text(
            text, // Text content
            style: TextStyle(color: Colors.grey[800], fontSize: 15), // Text style
          ),
        ),
      ],
    );
  }

  // Helper method to build status rows
  Widget _buildStatusRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Top padding
      child: Row(
        children: [
          Icon(icon, color: color, size: 20), // Icon with color
          const SizedBox(width: 8), // Space
          Text(
            text, // Status text
            style: TextStyle(color: color, fontSize: 15), // Text style with color
          ),
        ],
      ),
    );
  }
}