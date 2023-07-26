import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/util/validation.dart';

class SignUp extends StatefulWidget {
  final GlobalKey<FormState> loginScreenFormKey;
  const SignUp(this.loginScreenFormKey, {super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKeySignUp = GlobalKey<FormState>();
  void _processData() {
    // Process your data and upload to server
    _formKeySignUp.currentState?.reset();
    widget.loginScreenFormKey.currentState?.reset();
    Navigator.pop(context);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confPassword;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool? autoValidate = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                validator: AuthValidators.validateEmail,
                onSaved: (value) => email = value,
                textInputAction: TextInputAction.next,
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
                keyboardType: TextInputType.visiblePassword,
                validator: AuthValidators.validatePassword,
                onSaved: (value) => password = value,
                textInputAction: TextInputAction.next,
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
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                obscureText: confirmPasswordVisible,
                controller: confirmpasswordController,
                validator: (value) => AuthValidators.confirmPassword(
                    value, passwordController.text),
                onSaved: (value) => confPassword = value,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          confirmPasswordVisible = !confirmPasswordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40.0),
                height: 50,
                width: 300,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _processData();
                      // Navigator.pop(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Login()));
                    } else {
                      setState(() {
                        autoValidate = true;
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
