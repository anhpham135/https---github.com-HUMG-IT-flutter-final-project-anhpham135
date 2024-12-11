import 'package:final1/config/theme/app_theme.dart';
import 'package:final1/screen/home_screen.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
// các thư viện sẽ sử dụng trong project này 
/* 
  equatable 
  equatable: ^2.0.7
  flex_color_scheme: ^8.0.1
  flutter_riverpod: ^2.6.1
  font_awesome_flutter: ^10.8.0
  gap: ^3.0.1
  go_router: ^14.6.1
  google_fonts: ^6.2.1
  intl: ^0.20.1
  path: ^1.9.0
  sqflite: ^2.4.1
*/