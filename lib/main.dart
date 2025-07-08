import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:RAGDANews/ui/home/news/news_view_model.dart';
import 'package:RAGDANews/ui/home/profile/profile_view_model.dart';
import 'package:RAGDANews/ui/login/login_screen.dart';
import 'package:RAGDANews/ui/login/login_view_model.dart';
import 'package:RAGDANews/ui/navbar/bottom_navbar.dart';
import 'package:RAGDANews/ui/splash/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => NewsViewModel())
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ragdalion Technical Test",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const BottomNavBar(),
      },
    );
  }
}
