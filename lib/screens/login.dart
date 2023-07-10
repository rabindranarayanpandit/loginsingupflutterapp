import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/screens/forgotpassword.dart';
import 'package:loginsingupflutterapp/screens/signup.dart';
import 'package:loginsingupflutterapp/screens/homescreen.dart';
import 'package:loginsingupflutterapp/util/validation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? autoValidate = false;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: formUI()),
      ),
    );
  }

  Widget formUI() {
    return Column(
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
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            controller: nameController,
            validator: validateEmail,
            onSaved: (value) => email = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            autofocus: false,
            obscureText: true,
            controller: passwordController,
            validator: validatePassword,
            onSaved: (value) => password = value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
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
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                  nameController.clear();
                  passwordController.clear();
                } else {
                  setState(() {
                    // validation error
                    autoValidate = true;
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
            )
          ],
        ),
      ],
    );
  }
}
