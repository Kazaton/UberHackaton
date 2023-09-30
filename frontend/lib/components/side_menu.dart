import 'package:flutter/material.dart';

class Bus {
  final String name;
  final int numberOfPeople;
  final int numberOfSeats;

  Bus({
    required this.name,
    required this.numberOfPeople,
    required this.numberOfSeats,
  });
}

class SideMenu extends StatelessWidget {
  final List<Bus> buses = [
    Bus(name: 'Bus 1', numberOfPeople: 20, numberOfSeats: 40),
    Bus(name: 'Bus 2', numberOfPeople: 25, numberOfSeats: 45),
  ];

  final ImageProvider busIcon = AssetImage('assets/bus_icon_purple.png');

  SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 65.0,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              height: 750,
              child: ListView.builder(
                itemCount: buses.length,
                itemBuilder: (context, index) {
                  final bus = buses[index];
                  return ListTile(
                    leading: ImageIcon(busIcon, size: 48),
                    title: Text(bus.name),
                    subtitle: Text(
                      'Number of People: ${bus.numberOfPeople}\n'
                      'Number of Seats: ${bus.numberOfSeats}',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
