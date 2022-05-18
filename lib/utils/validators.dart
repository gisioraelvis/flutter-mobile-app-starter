class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  //Minimum six characters, at least one letter, one number and one special character no maximum length
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$',
  );

  // required validator
  static required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
  }

  static isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Required';
    }

    if (!_emailRegExp.hasMatch(email)) {
      return 'Invalid email';
    }
    return null;
  }

  static isValidPassword(String? password) {
    print('--------password: $password --------');
    if (password == null || password.isEmpty) {
      return 'Required';
    }

    if (!_passwordRegExp.hasMatch(password)) {
      return "Password must contain:\n "
          "Minimum six characters\n "
          "At least one letter\n "
          "One number and\n "
          "One special character";
    }
    return null;
  }

  // confirm password validator
  static confirmPasswordMatch(String? password, String? confirmPassword) {
    print('-------confirmPassword: $confirmPassword ----------------');
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Required';
    }

    if (password != confirmPassword) {
      return 'Password does not match';
    }
    return null;
  }
}
