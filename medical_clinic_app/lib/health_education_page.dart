import 'package:flutter/material.dart';

class HealthEducationPage extends StatelessWidget {
  const HealthEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Educations'),
        backgroundColor: const Color.fromARGB(255, 99, 181, 249),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Important Tips for a Healthy Life',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://freevector-images.s3.amazonaws.com/uploads/vector/preview/85983/vecteezyNewYearResolutionBackgroundfa1021_generated.jpg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const Text(
              '1. Eat a Balanced Diet: Include fruits, vegetables, lean proteins, and whole grains in your meals.\n'
              '2. Stay Hydrated: Drink at least 8 glasses of water daily.\n'
              '3. Exercise Regularly: Aim for 30 minutes of moderate exercise, like walking or cycling, each day.\n'
              '4. Get Adequate Sleep: Ensure 7-8 hours of quality sleep each night.\n'
              '5. Practice Good Hygiene: Wash your hands frequently and maintain oral hygiene by brushing and flossing daily.\n'
              '6. Manage Stress: Practice relaxation techniques like deep breathing, meditation, or yoga.\n'
              '7. Limit Screen Time: Reduce time spent on screens, especially before bed, to improve sleep quality.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
