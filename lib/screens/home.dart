import 'package:flutter/material.dart';
import 'hotelcard.dart'; // Import widget HotelCard
import 'hotel.dart';

class HomeScreen extends StatefulWidget {
  final List<Hotel> hotels;

  HomeScreen({required this.hotels});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearchBarVisible = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchBarVisible
            ? TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search hotels...',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        )
            : Text('Hotel List'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearchBarVisible = !isSearchBarVisible;
                if (!isSearchBarVisible) {
                  // Clear search when closing search bar
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0)
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.hotels.length,
              itemBuilder: (context, index) {
                return HotelCard(hotel: widget.hotels[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
