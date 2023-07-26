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
  int id = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool passwordVisible = false;
  bool? autoValidate = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    FocusNode().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: nameController,
                    validator: AuthValidators.validateEmail,
                    onChanged: (value) => setState(() => email = value),
                    // onChanged: (value) => email = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofocus: false,
                    obscureText: passwordVisible,
                    controller: passwordController,
                    validator: AuthValidators.validatePassword,
                    onChanged: (value) => setState(() => password = value),
                    //onChanged: (value) => password = value,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        )),
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
                    width: 300,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(_formKey)))
                              .then((value) => setState(() {
                                    _formKey.currentState?.reset();
                                    nameController.text = "";
                                    passwordController.text = "";
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  }));
                        } else {
                          setState(() {
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
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp(_formKey)))
                            .then((_) => _formKey.currentState!.reset());
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
