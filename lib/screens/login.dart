import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/screens/forgotpassword.dart';
import 'package:loginsingupflutterapp/screens/signup.dart';
import 'package:loginsingupflutterapp/screens/homescreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValidUserName = false;
  bool isValidPassWord = false;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
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
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                  errorText: isValidUserName ? 'Please enter your email' : null,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    errorText:
                        isValidPassWord ? 'Please enter your password' : null),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    } else {
                      setState(() {
                        nameController.text.isEmpty
                            ? isValidUserName = true
                            : isValidUserName = false;
                        passwordController.text.isEmpty
                            ? isValidPassWord = true
                            : isValidPassWord = false;
                      });
                    }
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
