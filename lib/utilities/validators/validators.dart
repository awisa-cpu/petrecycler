class CValidators {
  static String? validateEmptyText(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else {
      return null;
    }
  }

  //validate email
  static String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'Email is required';
    }

    //regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(text)) {
      //if it does not match this pattern
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    //check for minimum password length
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    //check for uppercase letters
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // }

    //check for uppercase letters
    // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain at least one special character';
    // }

    return null;
  }

  //validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number  is required';
    }

    final phoneRegExp = RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      //if it does not match
      return 'Invalid phone number format (10 digits required)';
    }
    return null;
  }

  //add more custom validators as required for your specifi requirements
}
