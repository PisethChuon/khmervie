
import 'package:Khmervie/Navagation/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: HomeBarNavigator());
  }
}

// class UserListScreen extends StatefulWidget {
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }

// class _UserListScreenState extends State<UserListScreen> {
//   final ApiService apiService = ApiService();
//   late Future<List<dynamic>> users;

//   @override
//   void initState() {
//     super.initState();
//     users = apiService.getUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Users')),
//       body: FutureBuilder<List<dynamic>>(
//         future: users,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data?.length,
//                 itemBuilder: (context, index) {
//                   final user = snapshot.data![index];
//                   return ListTile(
//                     title: Text(user["name"]),
//                     subtitle: Text("Role: ${user['id']}"),
//                   );
//                 });
//           } else {
//             return Center(
//               child: Text('No user found'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Demo Hunt Color', style: TextStyle(color: Colors.black)),
//           backgroundColor: Colors.transparent, // Make AppBar background transparent
//           elevation: 0, // Remove default AppBar shadow
//         ),
//         body: GradientBackground(),
//       ),
//     );
//   }
// }

// class GradientBackground extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.yellow.shade700, Colors.amber],
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           // Title
//           Text(
//             'Elevator Buttons',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           SizedBox(height: 40),
//           // Button 1
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 1'),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.black, backgroundColor: Colors.white,
//               elevation: 5,
//               shadowColor: Colors.amber,
//             ),
//           ),
//           SizedBox(height: 20),
//           // Button 2
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 2'),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.black, backgroundColor: Colors.white,
//               elevation: 5,
//               shadowColor: Colors.amber,
//             ),
//           ),
//           SizedBox(height: 20),
//           // Button 3
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 3'),
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.black, backgroundColor: Colors.white,
//               elevation: 5,
//               shadowColor: Colors.amber,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
