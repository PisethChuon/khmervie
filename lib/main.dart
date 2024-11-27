import 'package:flutter/material.dart';
import 'api/api_service.dart';  // Ensure correct import of ApiService

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      home: UserDetailScreen(userId: 1), // Pass the user ID to display a specific user
    );
  }
}

class UserDetailScreen extends StatefulWidget {
  final int userId;

  UserDetailScreen({required this.userId});

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final ApiService apiService = ApiService();
  late Future<Map<String, dynamic>> user;

  @override
  void initState() {
    super.initState();
    user = apiService.getUserById(widget.userId); // Fetch user by ID
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${user['name']}", style: TextStyle(fontSize: 24)),
                  Text("Role: ${user['role']}", style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else {
            return Center(child: Text('User not found.'));
          }
        },
      ),
    );
  }
}




      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // Example: Add a new user
      //     final newUser = await apiService.createUser("Charlie", "editor");
      //     setState(() {
      //       users = apiService.getUsers(); // Refresh the list
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),