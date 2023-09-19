import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InteractiveMap()
    );
  }

}
class InteractiveMap extends StatefulWidget {
  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  List<bool> showRoutes = List.generate(10, (index) => false);

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
                    'assets/your_map.png', // Основная карта
                    width: 2414,
                    height: 3080,
                    fit: BoxFit.fill,
                  ),
                  for (int i = 0; i < 10; i++)
                    if (showRoutes[i]) // Показываем маршруты только если они включены
                      Image.asset(
                        'assets/${i + 1}.png', // Изображения маршрутов
                        width: 2414,
                        height: 3080,
                        fit: BoxFit.fill,
                      ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showRoutes[index] = !showRoutes[index];
                  });
                },
                child: Text('Маршрут ${index + 1}'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

