import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});


  static const List<Map<String, String>> courses = [
    {
      "title": "Full Stack Web Development with JavaScript (MERN)",
      "batch": "ব্যাচ ১১",
      "seats": "৯ সিট বাকি",
      "days": "৯ দিন বাকি",
      "image": "https://cdn.ostad.app/course/cover/2025-12-08T14-25-01.527Z-Course-Thumbnail-12.jpg",
    },
    {
      "title": "Full Stack Web Development with Python, Django & React",
      "batch": "ব্যাচ ৭",
      "seats": "৮৩ সিট বাকি",
      "days": "৪৩ দিন বাকি",
      "image": "https://cdn.ostad.app/course/cover/2025-12-08T14-31-25.697Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg",
    },
    {
      "title": "Full Stack Web Development with ASP.Net Core",
      "batch": "ব্যাচ ৭",
      "seats": "৭৭ সিট বাকি",
      "days": "৩১ দিন বাকি",
      "image": "https://cdn.ostad.app/course/cover/2025-05-26T20-30-33.592Z-Cover%20[%20Website%20+%20Facebook%20Group]%20(3).jpg",
    },
    {
      "title": "SQA: Manual & Automated Testing",
      "batch": "ব্যাচ ১৩",
      "seats": "৪২ সিট বাকি",
      "days": "৫১ দিন বাকি",
      "image": "https://cdn.ostad.app/course/photo/2024-12-18T15-24-44.114Z-Untitled-1%20(21).jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Courses", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // const যোগ করা হয়েছে
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.62, // Overflow রোধে কিছুটা বাড়ানো হয়েছে
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return CourseCard(course: courses[index]);
          },
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Map<String, String> course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                course['image']!,
                fit: BoxFit.cover,

                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(color: Colors.grey[100]);
                },
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[300], child: const Icon(Icons.image_not_supported)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    _buildTag(course['batch']!),
                    _buildTag(course['seats']!, icon: Icons.people_outline),
                    _buildTag(course['days']!, icon: Icons.access_time),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  course['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F2F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("বিস্তারিত দেখি", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F2F6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 11, color: Colors.grey[600]),
          if (icon != null) const SizedBox(width: 2),
          Text(text, style: const TextStyle(fontSize: 9, color: Colors.black87)),
        ],
      ),
    );
  }
}
