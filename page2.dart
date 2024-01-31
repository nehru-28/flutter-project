import 'package:flutter/material.dart';

void main() {
  runApp(Page2());
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SportsMeetPage(),
    );
  }
}

class SportsMeetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports Meet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  'https://dlabs.ai/wp-content/uploads/2022/04/ai-in-sport-kopia.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'SYNERGY',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Event Description',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'A sports meet is being organised in the college according to the following details. It will include various games such as basketball,football and cricket. Students from any college carrying their official ID card are allowed to participate.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(width: 8),
                    Text('Date: January 8, 2024'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 8),
                    Text('Time: 10:00 AM'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text('Venue: IGDTUW ground'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Interested'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Not Interested'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}