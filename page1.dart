import 'package:flutter/material.dart';

void main() {
  runApp(Page1());
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: EventHubPage(),
    );
  }
}

class EventHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Hub'),
        backgroundColor: const Color.fromARGB(230, 200, 55, 220),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://dlabs.ai/wp-content/uploads/2022/04/ai-in-sport-kopia.png',
                height: 150,
              ),
              SizedBox(height: 60),
              Text(
                'Upcoming Events: ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('AI Workshop'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Sports Meet'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: Text('Coding Contest'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}