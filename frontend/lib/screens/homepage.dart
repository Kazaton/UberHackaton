import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/urls.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: InteractiveMap()
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
  const InteractiveMap({super.key});

  @override
  State <InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {

  Future<List<Bus>> getBusList() async {
    try {
      final response = await http.get(Uri.parse(busListRef));
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

  List<bool> showRoutes = [];
  List<Bus> buses = [];

  @override
  void initState() {
    super.initState();
    getBusList().then((busList) {
      setState(() {
        buses = busList;
        showRoutes = List.generate(buses.length, (index) => false); // Инициализация showRoutes
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
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
                    'assets/your_map.png', // Main map
                    width: 2414,
                    height: 3080,
                    fit: BoxFit.fill,
                  ),
                  for (final bus in buses)
                    if (showRoutes[bus.id - 1]) // If route chosen, show it
                      Image.asset(
                        'assets/${bus.id}.png', // Print routes
                        width: 2414,
                        height: 3080,
                        fit: BoxFit.fill,
                      ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: buses.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child:  ElevatedButton(
                onPressed: () {
                  setState(() {
                    showRoutes[buses[index].id - 1] = !showRoutes[buses[index].id - 1];
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.directions_bus,
                    ),
                    Text(buses[index].name),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

