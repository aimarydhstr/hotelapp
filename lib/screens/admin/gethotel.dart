import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'detailhotel.dart';
import 'createhotel.dart';
import 'edithotel.dart';
import '../../apimanager.dart';
import '../../usermanager.dart';

class Hotel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String location;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.location,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
    );
  }
}

class MyHotel extends StatefulWidget {
  @override
  _MyHotelState createState() => _MyHotelState();
}

class _MyHotelState extends State<MyHotel> {
  List<Hotel> hotels = [];

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  Future<void> getHotels() async {
    try {
      final apiManager = Provider.of<ApiManager>(context, listen: false);
      final response = await apiManager.getHotelDashboard();
      setState(() {
        hotels = response.map((json) => Hotel.fromJson(json)).toList();
      });
    } catch (e) {
      print('Error getting hotels: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiManager = Provider.of<ApiManager>(context);
    final userManager = Provider.of<UserManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Management'),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hotels[index].name),
            subtitle: Text(hotels[index].location),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetails(hotel: hotels[index]),
                ),
              );
            },
            onLongPress: () {
              // Show options for edit/delete
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Options'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelUpdate(
                                  hotel: hotels[index],
                                  onUpdate: getHotels,
                                ),
                              ),
                            );
                          },
                          child: Text('Edit'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await apiManager.deleteHotel(hotels[index].id);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelCreate(onCreate: getHotels),
            ),
          );
        },
        tooltip: 'Add Hotel',
        child: Icon(Icons.add),
      ),
    );
  }
}
