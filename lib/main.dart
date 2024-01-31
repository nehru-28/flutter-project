import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'attendee_model.dart';
import 'event_model.dart';
import 'event_list_screen.dart';


class attendee {
  String uid;
  String displayName;
  String email;
  String userType; 

  attendee({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.userType,
  });
}

class organisation {
  final String uid;
  final String email;
  String organizationTagline;
  String organizationMotive;

  organisation({
    required this.uid,
    required this.email,
    required this.organizationTagline,
    required this.organizationMotive,
  });
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up with Email and Password
  Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error during sign up: $e");
      return null;
    }
  }

  // Sign In with Email and Password
  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error during sign in: $e");
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new event
  Future<void> createEvent(Map<String, dynamic> eventData) async {
    await _firestore.collection('events').add(eventData);
  }

  // Get all events
  Stream<QuerySnapshot> getAllEvents() {
    return _firestore.collection('events').snapshots();
  }

  // Update event details
  Future<void> updateEvent(
      String eventId, Map<String, dynamic> updatedEventData) async {
    await _firestore.collection('events').doc(eventId).update(updatedEventData);
  }

  // Delete event
  Future<void> deleteEvent(String eventId) async {
    await _firestore.collection('events').doc(eventId).delete();
  }
}

class SignInUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In/Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.organizationDetails);
              },
              child: Text('Go to Organization Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class OrganizationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Organization Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Organization Tagline'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Organization Motive'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Save Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Event Details'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Create Event'),
            ),
            ElevatedButton(
              onPressed: () {
                EventService eventService = EventService();
                eventService.createEvent({
                  'eventName': 'New Event',
                  'eventDetails': 'Some details',
                });
              },
              child: Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }
}

//Attendee

late Attendee _attendee;


class AttendeeDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  AttendeeDetailsScreen({required this.userData});

  @override
  _AttendeeDetailsScreenState createState() => _AttendeeDetailsScreenState();
}

class _AttendeeDetailsScreenState extends State<AttendeeDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late Attendee _attendee;

  @override
  void initState() {
    super.initState();
    _attendee = Attendee(
      name: widget.userData['name'] ?? '',
      course: widget.userData['course'] ?? '',
      branch: widget.userData['branch'] ?? '',
      year: widget.userData['year'] ?? 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendee Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _attendee.name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _attendee.course,
                decoration: InputDecoration(labelText: 'Course'),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Updated Attendee Details: ${_attendee.toString()}');
                    Navigator.pop(context, _attendee.toMap());
                  }
                },
                child: Text('Save Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}



class AttendeeprofileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = {
      'name': 'John Doe',
      'course': 'Computer Science',
      'branch': 'Information Technology',
      'year': 3,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${userData['name']}'),
            Text('Course: ${userData['course']}'),
            Text('Branch: ${userData['branch']}'),
            Text('Year: ${userData['year']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AttendeeDetailsScreen(userData: userData),
                  ),
                );
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class EventService1 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Event>> getAllEvents() {
    return _firestore.collection('events').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Event(
          name: data['name'] ?? '',
          date: data['date'] ?? '',
          location: data['location'] ?? '',
        );
      }).toList();
    });
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTSAH',
      initialRoute: Routes.signInUp,
      home: EventListScreen(),
      routes: {
        Routes.signInUp: (context) => SignInUpScreen(),
        Routes.organizationDetails: (context) => OrganizationDetailsScreen(),
        Routes.profile: (context) => ProfileScreen(),
        Routes.eventCreation: (context) => EventCreationScreen(),
      },
    );
  }
}
