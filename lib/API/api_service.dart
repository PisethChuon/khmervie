import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:5001";  // Update for Android emulator or localhost for iOS

  // Function to fetch a user by ID
  Future<Map<String, dynamic>> getUserById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/users/$id"));

    if (response.statusCode == 200) {
      print('Response: ${response.body}'); // Debugging output
      return jsonDecode(response.body);  // Returns a single user object
    } else {
      throw Exception("Failed to load user");
    }
  }
}



  // Future<Map<String, dynamic>> createUser(String name, String role) async {
  //   final response = await http.post(
  //     Uri.parse("$baseUrl/users"),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"name": name, "role": role}),
  //   );
  //   if (response.statusCode == 201) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception("Failed to create user");
  //   }
  // }