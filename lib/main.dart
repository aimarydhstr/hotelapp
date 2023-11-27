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
      name: 'Hotel Dominaredor',
      imageUrl: 'https://pix8.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg?ca=6&ce=1&s=1024x768',
      rating: 4.8,
      price: 3600000,
      location: 'Rakau',
    ),
    Hotel(
      name: 'Hotel Altadar',
      imageUrl: 'https://www.intechnic.com/hubfs/Blog/Featured%20Images/Best%20Hotel%20Website%20Designs.jpg',
      rating: 4.5,
      price: 3000000,
      location: 'El Scaro',
    ),
    Hotel(
      name: 'Hotel Sicanokami',
      imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2022/05/20/the-trans-resort-bali_169.jpeg?w=600&q=90',
      rating: 4.5,
      price: 3000000,
      location: 'Sofya',
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
