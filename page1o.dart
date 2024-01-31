import 'package:flutter/material.dart';

void main() {
  runApp(Page1());
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Event Hub"),
            backgroundColor: Color.fromARGB(202, 65, 38, 188)),
        body: Center(
          child: Column(
            children: [
              // Image.network(
              //   'https://images.app.goo.gl/t6pJsbiNXmWf4qJi9',
              //   height: 100,
              //   width: 200,
              // ),
              const Text(
                "UPCOMING EVENTS:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize:40),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                // Action for Button 1
                },
                child: Text('Button 1'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                // Action for Button 2
                },
                child: Text('Button 2'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                // Action for Button 3
                },
                child: Text('Button 3'),
              ),
            ],
          ),
        ));
  }
}
