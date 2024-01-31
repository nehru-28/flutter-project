import 'package:flutter/material.dart';
import 'event_model.dart';
import 'event_service.dart';

class EventListScreen extends StatelessWidget {
  final EventService eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: StreamBuilder<List<Event>>(
        stream: eventService.getAllEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Event> events = snapshot.data ?? [];
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                Event event = events[index];
                return ListTile(
                  title: Text(event.name),
                  subtitle: Text('${event.date} - ${event.location}'),
                  // Add more details as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
