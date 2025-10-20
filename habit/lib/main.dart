import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaBIT Note',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Mag extends StatefulWidget {
  const Mag({super.key});

  @override
  State<Mag> createState() => _MagState();
}

class _MagState extends State<Mag> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

