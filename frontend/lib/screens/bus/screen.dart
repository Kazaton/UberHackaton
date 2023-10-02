// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/urls.dart';
import 'package:frontend/context/token_service.dart';
import 'package:frontend/screens/homepage.dart';
import 'package:http/http.dart' as http;

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

class BusRegisterScreen extends StatefulWidget {
  final String url;
  const BusRegisterScreen({super.key, required this.url});

  @override
  State<BusRegisterScreen> createState() => _BusRegisterScreenState();
}

class _BusRegisterScreenState extends State<BusRegisterScreen> {
  late Future<List<dynamic>> reasons;
  String? selectedReasonId;
  late Future<Bus> bus;
  bool takeSeat = false;

  Future<Bus> fetchBusFromList(int id) async {
    final url = Uri.parse(busListRef);
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      throw 'Access token is not available';
    }
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> buses = json.decode(response.body);
      for (var busData in buses) {
        Bus bus = Bus.fromJson(busData);
        if (bus.id == id) {
          return bus;
        }
      }
      throw Exception('Bus with ID $id not found');
    } else {
      throw Exception('Failed to load buses');
    }
  }

  Future<List<dynamic>> fetchSeatReasons() async {
    final url = Uri.parse(seatReasonsRef);
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      throw 'Access token is not available';
    }
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }

  Future<void> registerForBus(String urlString) async {
    final url = Uri.parse(urlString);
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    if (accessToken == null) {
      throw 'Access token is not available';
    }
    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };
    final seatReasonId = selectedReasonId != null ? int.parse(selectedReasonId!) : null;
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        'seat_reason_id': takeSeat ? seatReasonId : null,
      }),
    );
    if (response.statusCode == 200) {
      return;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }

  @override
  void initState() {
    super.initState();
    int busId = int.parse(widget.url.split('/').reversed.elementAt(1));
    bus = fetchBusFromList(busId);
    reasons = fetchSeatReasons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register for Bus",
            style: TextStyle(color: Color(0xFFEDF6FF))),
        foregroundColor: const Color(0xFFEDF6FF),
        backgroundColor: const Color(0xFF021213),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FutureBuilder<Bus>(
              future: bus,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  Bus busData = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bus Number: ${busData.name}',
                          style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 30),
                      const Text('Bus Info:',
                          style: TextStyle(fontSize: 18)),
                      Text(
                        'Current number of people: ${busData.numberOfPeople}/${busData.maxNumberOfPeople}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Total seats: ${busData.numberOfSeats}/${busData.maxNumberOfSeats}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Would you like to take a seat?"),
              value: takeSeat,
              onChanged: (bool? value) {
                setState(() {
                  takeSeat = value!;
                });
              },
            ),
            if (takeSeat)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Choose your reason from the list:",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  FutureBuilder<List<dynamic>>(
                    future: reasons,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        return DropdownButton<int>(
                          value: selectedReasonId != null ? int.parse(selectedReasonId!) : null,
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedReasonId = newValue?.toString();
                            });
                          },
                          items: snapshot.data!
                              .map<DropdownMenuItem<int>>((dynamic value) {
                            return DropdownMenuItem<int>(
                              value: value['id'] as int,
                              child: Text(value['reason'] as String),
                            );
                          }).toList(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await registerForBus(widget.url);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: Text(e.toString()),
                        actions: [
                          TextButton(
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
