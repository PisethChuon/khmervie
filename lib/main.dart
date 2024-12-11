// import 'package:Khmervie/Navagation/home.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(home: HomeBarNavigator());
//   }
// }




import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FaceIDExample extends StatefulWidget {
  @override
  _FaceIDExampleState createState() => _FaceIDExampleState();
}

class _FaceIDExampleState extends State<FaceIDExample> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  String _authorized = 'Not authorized';

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      canCheckBiometrics = false;
    }
    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not authorized';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Face ID Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Can check biometrics: $_canCheckBiometrics'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text('Authenticate with Face ID'),
            ),
            SizedBox(height: 20),
            Text('Authentication status: $_authorized'),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: FaceIDExample()));
