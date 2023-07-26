import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<FormState> firstScreenFormKey;
  const HomeScreen(this.firstScreenFormKey, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _listItem = [
    'assets/images/furniture_1.jpg',
    'assets/images/furniture_2.jpg',
    'assets/images/furniture_3.jpg',
    'assets/images/furniture_4.jpg',
    'assets/images/furniture_5.jpg',
    'assets/images/furniture_6.jpg',
    'assets/images/furniture_7.jpg',
    'assets/images/furniture_8.jpg',
    'assets/images/furniture_9.jpg',
    'assets/images/furniture_10.jpg',
    'assets/images/furniture_11.jpg',
    'assets/images/furniture_12.jpg',
    'assets/images/furniture_13.jpg',
    'assets/images/furniture_14.jpg',
    'assets/images/furniture_15.jpg',
    'assets/images/furniture_16.jpg',
    'assets/images/furniture_17.jpg',
    'assets/images/furniture_18.jpg',
  ];
  void _processData() {
    // Process your data and upload to server
    Navigator.pop(context);
    widget.firstScreenFormKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => _processData(),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text("0")),
            ),
          )
        ],
      ),
      //AppBar
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/furniture_1.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        "Home Designs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Make My Room Special",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map((item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: const Offset(50, -50),
                            ),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ), // center
    );
  }
}
