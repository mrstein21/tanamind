

emailValidator(String value){
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)
      ? null
      : 'Incorrect email address';
}

nickNameValidator(String value){
  if (value.isEmpty) {
    return "name must not empty";
  } else if (value.length < 4) {
    return "name must greater than 6 character";
  } else {
    return null;
  }
}

lastNameValidator(String value){
  if (value.isEmpty) {
    return "name must not empty";
  } else if (value.length < 4) {
    return "name must greater than 6 character";
  } else {
    return null;
  }
}

phoneValidator(String value){
  if (value.isEmpty) {
    return "phone number must not empty";
  } else if (value.length < 11) {
    return "name must greater than 11 character";
  } else {
    return null;
  }
}

passwordValidator(String value){
  if (value.isEmpty) {
    return "Password must not empty";
  } else if (value.length < 4) {
    return "Password must 6 character or more";
  } else {
    return null;
  }
}