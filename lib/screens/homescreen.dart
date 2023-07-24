import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/screens/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ), //AppBar
      body: const Center(
        child: Text(
          'Welcome To Home Screen',
          style: TextStyle(fontSize: 24),
        ), //Text
      ), // center
    );
  }
}
