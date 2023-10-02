// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/context/token_service.dart';
import 'package:frontend/screens/auth/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/constants/urls.dart';

class Bus {
  final String name;
  final int id;
  final int numberOfPeople;
  final int numberOfSeats;
  final int maxNumberOfPeople;
  final int maxNumberOfSeats;

  Bus({
    required this.name,
    required this.id,
    required this.numberOfPeople,
    required this.numberOfSeats,
    required this.maxNumberOfPeople,
    required this.maxNumberOfSeats,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      name: json['name'],
      id: json['id'],
      numberOfPeople: json['number_of_people'],
      numberOfSeats: json['number_of_seats'],
      maxNumberOfPeople: json['bus_type']['number_of_people'],
      maxNumberOfSeats: json['bus_type']['number_of_seats'],
    );
  }
}

class SideMenuBuses extends StatelessWidget {

  final Function(int) onBusSelected;

  const SideMenuBuses({required this.onBusSelected, Key? key}) : super(key: key);

  Future<List<Bus>> fetchBuses() async {
    final response = await http.get(Uri.parse(busListRef));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((entry) => Bus.fromJson(entry)).toList();
    } else {
      throw Exception('Failed to load buses');
    }
  }
  
  Future<void> registerForBus(int busId) async {
    final url = Uri.parse('$busRegisterRef$busId/');
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      throw 'Access token is not available';
    }
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      return;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }

  Future<void> exitFromBus(int busId) async {
    final url = Uri.parse('$busExitRef$busId/');
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      throw 'Access token is not available';
    }
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.post(url, headers: headers);
    if (response.statusCode == 200) {
      return;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }

  Future<int> getUsersBus() async {
    try {
      final url = Uri.parse(getUsersBusRef);
      final tokenService = TokenService();
      final accessToken = await tokenService.getAccessToken();
      if (accessToken == null) {
        throw 'Access token is not available';
      }
      final headers = {
        'Authorization': 'Bearer $accessToken',
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        int id = data["id"] as int;
        return id;
      } else {
        throw Exception('Error');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Bus>>(
              future: fetchBuses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final buses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: buses.length,
                    itemBuilder: (context, index) {
                      final bus = buses[index];
                      return ListTile(
                        leading: const Icon(Icons.directions_bus_rounded, size: 48, color: Colors.white),
                        title: Text(bus.name),
                        subtitle: Text(
                          'People: ${bus.numberOfPeople}/${bus.maxNumberOfPeople}\n'
                          'Seats: ${bus.numberOfSeats}/${bus.maxNumberOfSeats}',
                        ),
                        onTap: () {
                          onBusSelected(bus.id);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
              },
            ),
            ElevatedButton(
                      onPressed: () async {
                        await logout(context);
                      },
                      child: const Text('Logout'),
                    ),
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    final tokenService = TokenService();
    await tokenService.deleteTokens();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

}
