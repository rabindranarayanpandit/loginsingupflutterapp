String? validatePassword(String? value) {
  final RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (value!.isEmpty) {
    return "Password is Required";
  } else if (!regex.hasMatch(value)) {
    return 'Password required: Alphabet, Number & 8 chars';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
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
