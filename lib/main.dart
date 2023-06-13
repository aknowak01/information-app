import 'package:flutter/material.dart';
import 'package:nasa_information_app/view/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Information app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.grey[900],
          ),
          scaffoldBackgroundColor: Colors.grey[800],
          drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[800]),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white))),
      home: const HomePage(title: 'Nasa Moon View'),
    );
  }
}
