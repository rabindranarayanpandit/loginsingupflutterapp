import 'package:flutter/material.dart';

class AuthValidators {
  static String? validatePassword(String? value) {
    debugPrint("password:-$value");
    final RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (!regex.hasMatch(value)) {
      return 'Password required: Alphabet, Number & 8 chars';
    } else {
      return null;
    }
  }

  static String? confirmPassword(String? value, previousPasswordInpTxt) {
    final String previousEntredPassword = previousPasswordInpTxt;
    debugPrint("Confirm password:-$value");
    if (value == null || value.isEmpty) {
      return 'Confirm Password is Required';
    }
    if (previousEntredPassword != value) {
      return 'Confimation password does not match the entered password';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value!.isEmpty) {
      return "Email is Required";
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }
}
