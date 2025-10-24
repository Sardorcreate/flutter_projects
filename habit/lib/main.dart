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

