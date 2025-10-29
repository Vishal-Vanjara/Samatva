import 'package:flutter/material.dart';
import 'package:samatva/screens/quiz/quiz_screen.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3E0EF),
      appBar: AppBar(
        title: const Text(
          'Samatva',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Good Afternoon, Vishal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6),
                      Chip(
                        backgroundColor: Color(0xFFD6EAF8),
                        label: Text(
                          'Vata Dominant • 78% Balance',
                          style: TextStyle(color: Color(0xFF2471A3)),
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.settings, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Today’s Focus Card
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/morning_meditation.jpg',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Chip(
                        backgroundColor: Colors.grey,
                        label: Text(
                          "Today's Focus",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Morning Meditation & Warm Breakfast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Start your day with grounding practices to balance your Vata energy.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Recommended Foods
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recommended Foods',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _foodCard('Oatmeal', 'Nourishing',
                      'assets/images/oatmeal.jpg', Colors.orange),
                  _foodCard('Golden Milk', 'Calming',
                      'assets/images/golden_milk.jpg', Colors.yellow.shade700),
                  _foodCard('Ginger Tea', 'Energizing',
                      'assets/images/ginger_tea.jpg', Colors.redAccent),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Today’s Schedule
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Today's Schedule",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _scheduleTile('6:00 AM', 'Morning Meditation'),
            _scheduleTile('8:00 AM', 'Warm Breakfast'),
            _scheduleTile('7:00 PM', 'Evening Reflection'),
          ],
        ),
      ),

      // Floating Quick Check-in Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizScreen()));
        },
        label: const Text('Quick Test'),
        icon: const Icon(Icons.favorite_border),
        backgroundColor: Colors.blueGrey,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Food Card Widget
  static Widget _foodCard(
      String title, String tag, String image, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(image, height: 70, width: 120, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(tag,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Schedule Card Widget
  static Widget _scheduleTile(String time, String task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.access_time, color: Colors.green.shade700),
        title: Text(task, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(time),
      ),
    );
  }
}
