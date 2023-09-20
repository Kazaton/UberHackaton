import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/constants/urls.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: InteractiveMap());
  }
}

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  State<InteractiveMap> createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  List<bool> showRoutes = List.generate(10, (index) => false);

  Future<String> _getBusName(int index) async {
    try {
      final response = await http.get(Uri.parse(busRef + index.toString()));
      if (response.statusCode == 200) {
        // If request is ok, return bus' data
        final Map<String, dynamic> data = json.decode(response.body);
        return data['name'];
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
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
                  for (int i = 0; i < 10; i++)
                    if (showRoutes[i]) // If route chosen, show it
                      Image.asset(
                        'assets/${i + 1}.png', // Print routes
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
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: FutureBuilder<String>(
                  future: _getBusName(index),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showRoutes[index] = !showRoutes[index];
                          });
                        },
                        child: Text(snapshot.data ?? 'Name not found'),
                      );
                    } else {
                      return Text('Name not found');
                    }
                  },
                )),
          ),
        ),
      ],
    );
  }
}
