import 'package:flutter/material.dart';

enum TaskCategories {
  educaiton(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  orther(Icons.calendar_month, Colors.purple),
  shopping(Icons.shopping_bag, Colors.pink),
  social(Icons.people, Colors.brown),
  travel(Icons.flight, Colors.deepOrange),
  work(Icons.work, Colors.amber);

  final IconData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);
}
