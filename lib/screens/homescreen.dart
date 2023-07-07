import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Home'),
          centerTitle: true,
        ), //AppBar
        body: const Center(
          child: Text(
            'Welcome To Home Screen',
            style: TextStyle(fontSize: 24),
          ), //Text
        ), // center
      ), //Scaffold
      debugShowCheckedModeBanner: false, //Removing Debug Banner
    );
  }
}
