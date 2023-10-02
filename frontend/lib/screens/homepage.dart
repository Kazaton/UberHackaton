import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/components/side_menu.dart';
import 'package:frontend/components/qr_scan_widget.dart';
import 'package:frontend/constants/urls.dart';
import 'package:frontend/context/token_service.dart';
import 'package:frontend/screens/user_type/person.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedBusId;

  void selectBus(int busId) {
    setState(() {
      selectedBusId = busId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kazaton',
          style: TextStyle(color: Color(0xFFEDF6FF)),
        ),
        backgroundColor: const Color(0xFF021213),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              color: const Color(0xFFEDF6FF),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: InteractiveMap(selectedBusId: selectedBusId),
      endDrawer: SideMenuBuses(onBusSelected: selectBus),
    );
  }
}

class BusType {
  final int id;
  final String name;
  final int numberOfPeople;
  final int numberOfSpecialSeats;

  BusType({
    required this.id,
    required this.name,
    required this.numberOfPeople,
    required this.numberOfSpecialSeats,
  });

  factory BusType.fromJson(Map<String, dynamic> json) {
    return BusType(
      id: json['id'],
      name: json['name'],
      numberOfPeople: json['number_of_people'],
      numberOfSpecialSeats: json['number_of_special_seats'],
    );
  }
}

class Bus {
  final int id;
  final String name;
  final int numberOfPeople;
  final int numberOfSpecialSeats;
  final BusType busType;

  Bus({
    required this.id,
    required this.name,
    required this.numberOfPeople,
    required this.numberOfSpecialSeats,
    required this.busType,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      name: json['name'],
      numberOfPeople: json['number_of_people'],
      numberOfSpecialSeats: json['number_of_special_seats'],
      busType: BusType.fromJson(json['bus_type']),
    );
  }
}

class InteractiveMap extends StatefulWidget {
  final int? selectedBusId;

  const InteractiveMap({this.selectedBusId, Key? key}) : super(key: key);

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  bool isUserRegistered = false;
  Future<List<Bus>> getBusList() async {
    try {
      final tokenService = TokenService();
      final accessToken = await tokenService.getAccessToken();
      if (accessToken == null) {
        throw 'Access token is not available';
      }
      final headers = {
        'Authorization': 'Bearer $accessToken',
      };
      final response = await http.get(
        Uri.parse(busListRef),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Bus> buses = data.map((entry) {
          return Bus.fromJson(entry);
        }).toList();
        return buses;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<void> getUsersBus() async {
    try {
      final tokenService = TokenService();
      final accessToken = await tokenService.getAccessToken();
      if (accessToken == null) {
        throw 'Access token is not available';
      }
      final headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      final response = await http.get(
        Uri.parse(getUsersBusRef),
        headers: headers,
      );

      if (response.statusCode == 200) {
        isUserRegistered = true;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<void> exitFromBus(int? busId) async {
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
      isUserRegistered = false;
      print('Exited');
      return;
    } else {
      throw 'Error: ${response.statusCode}';
    }
  }


  List<bool> showRoutes = [];
  List<Bus> buses = [];

  @override
  void initState() {
    super.initState();
    getBusList().then((busList) {
      setState(() {
        buses = busList;
        showRoutes = List.generate(buses.length, (index) => false);
      });
    });
    getUsersBus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              GestureDetector(
                onScaleUpdate: (ScaleUpdateDetails details) {
                  print("Scale updated: ${details.scale}");
                },
                child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 5.0,
                  constrained: false,
                  boundaryMargin: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/map.png', // Main map
                        width: 2414,
                        height: 3080,
                        fit: BoxFit.fill,
                      ),
                      if (widget.selectedBusId !=
                          null) // If route chosen, show it
                        Image.asset(
                          'assets/${widget.selectedBusId}.png', // Print routes
                          width: 2414,
                          height: 3080,
                          fit: BoxFit.fill,
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QRCodeWidget()),
                    );
                  },
                  child: const Icon(Icons.qr_code_2_outlined),
                ),
              ),
              if (isUserRegistered)
                Positioned(
                  right: 80,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonScreen()),
                      );
                    },
                    child: const Icon(Icons.aod_rounded),
                  ),
                ),
              if (isUserRegistered)
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      exitFromBus(widget.selectedBusId);
                    },
                    child: const Icon(Icons.exit_to_app_rounded),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
