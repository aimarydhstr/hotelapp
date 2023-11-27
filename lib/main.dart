import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/home.dart';
import 'screens/hotel.dart';
import 'screens/detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  final List<Hotel> hotels = [
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),
    Hotel(
      name: 'Hotel A',
      imageUrl: 'https://all.accor.com/middleware/images/1385747632498/1681988911601/so-text-with-image-600x500-low.jpg',
      rating: 4.5,
      price: 150,
      location: 'City A',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HotelApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => MyLogin(),
        '/register': (context) => MyRegister(),
        '/home': (context) => HomeScreen(hotels: hotels),
        '/register': (context) => MyRegister(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
