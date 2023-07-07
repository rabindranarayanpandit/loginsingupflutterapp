import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool isValidUserName = false;
  bool isValidPassWord = false;
  bool isConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
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
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: confirmpasswordController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    errorText: isConfirmPassword
                        ? 'Please confirm your password'
                        : null),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40.0),
                height: 50,
                padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    } else {
                      setState(() {
                        nameController.text.isEmpty
                            ? isValidUserName = true
                            : isValidUserName = false;
                        passwordController.text.isEmpty
                            ? isValidPassWord = true
                            : isValidPassWord = false;
                        confirmpasswordController.text.isEmpty
                            ? isConfirmPassword = true
                            : isConfirmPassword = false;
                      });
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
