import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              width: double.infinity,
              child: ElevatedButton(
                // Ganti warna latar belakang sesuai kebutuhan
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.blue, fontSize: 18.0),
                  ),
                ),
                onPressed: () {
                  // Perform login here
                  // Navigasi ke halaman dashboard dengan menggunakan "/dashboard"
                  Navigator.of(context).pushNamed('/dashboard');
                },
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'OR',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: ElevatedButton.icon(
                    // Ganti warna latar belakang sesuai warna Google
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    icon: Icon(FontAwesomeIcons.google, color: Colors.white),
                    label: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Google',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    onPressed: () {
                      // Perform login with Google here
                    },
                  ),
                ),
                ElevatedButton.icon(
                  // Ganti warna latar belakang sesuai warna Facebook
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  icon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
                  label: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  onPressed: () {
                    // Perform login with Facebook here
                  },
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Container(
              child: Text(
                'Dont have an account?',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
