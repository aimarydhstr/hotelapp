import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'detail.dart';
import 'hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetail(hotel: hotel),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              hotel.imageUrl,
              fit: BoxFit.cover,
              height: 200, // Atur tinggi sesuai kebutuhan Anda
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(hotel.rating.toString()),
                    ],
                  ),
                  Text('Price: \$${hotel.price} per night'),
                  Text('Location: ${hotel.location}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
