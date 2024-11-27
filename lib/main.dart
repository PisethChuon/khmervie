import 'package:flutter/material.dart';
import 'API/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<dynamic>> users;

  @override
  void initState() {
    super.initState();
    users = apiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: FutureBuilder<List<dynamic>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text(user["name"]),
                  subtitle: Text("Role: ${user["role"]}"),
                );
              },
            );
          } else {
            return Center(child: Text('No users found.'));
          }
        },
      ),
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
    );
  }
}
