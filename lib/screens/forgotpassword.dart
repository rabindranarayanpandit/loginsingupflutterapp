import 'package:flutter/material.dart';

import 'package:loginsingupflutterapp/screens/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController nameController = TextEditingController();
  bool isValidUserName = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Forgot Password'),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'TechSkill',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    errorText:
                        isValidUserName ? 'Please enter your email' : null,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                height: 50,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      } else {
                        setState(() {
                          nameController.text.isEmpty
                              ? isValidUserName = true
                              : isValidUserName = false;
                        });
                      }
                    }),
              ),
            ])));
  }
}
