import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Меню',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Элемент 1'),
            onTap: () {
              // Действия, которые выполняются при выборе элемента 1
              // Закрываем боковое меню
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Элемент 2'),
            onTap: () {
              // Действия, которые выполняются при выборе элемента 2
              // Закрываем боковое меню
              Navigator.pop(context);
            },
          ),
          // Добавьте другие элементы меню здесь
        ],
      ),
    );
  }
}
