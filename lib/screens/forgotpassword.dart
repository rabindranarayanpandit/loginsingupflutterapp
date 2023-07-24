import 'package:flutter/material.dart';
import 'package:loginsingupflutterapp/screens/login.dart';
import 'package:loginsingupflutterapp/util/validation.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? email;
  bool? autoValidate = false;
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

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
        body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                child: TextFormField(
                  autofocus: false,
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  validator: AuthValidators.validateEmail,
                  onSaved: (value) => email = value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      } else {
                        setState(() {
                          // validation error
                          autoValidate = true;
                        });
                      }
                    }),
              ),
            ])));
  }
}
