import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20.0, // ปรับขนาดตัวอักษร
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 221, 146, 33),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("rain.png"), // เปลี่ยนเป็นที่อยู่รูปภาพของพื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: TextStyle(fontSize: 16.0),
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16.0),
              TextField(
                style: TextStyle(fontSize: 16.0),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      ),
                    ),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
class SecondPage extends StatelessWidget {
  final String username;
  final String password;

  SecondPage({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Color.fromARGB(255, 187, 118, 16),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("rain.png"), // เปลี่ยนเป็นที่อยู่รูปภาพของพื้นหลัง
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Username: $username',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Password: $password',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
