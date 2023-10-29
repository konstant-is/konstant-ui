typedef ValidatorFn = String? Function(String?);

abstract class Validator {
  final List<ValidatorFn> _validators = [];

  String? validate(String? value) {
    for (final validator in _validators) {
      final error = validator(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  void addValidator(ValidatorFn validator) {
    _validators.add(validator);
  }
}

class InputValidator extends Validator {
  InputValidator();

  InputValidator notEmpty({String? message}) {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return message ?? 'This field cannot be empty';
      }
      return null;
    });

    return this;
  }

  InputValidator email() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'Email cannot be empty';
      }

      final emailRegExp =
          RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

      if (!emailRegExp.hasMatch(value)) {
        return 'Enter a valid email address';
      }

      return null;
    });

    return this;
  }

  InputValidator time() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'Time cannot be empty';
      }
      final timeRegExp = RegExp(r'^([01]\d|2[0-3]):([0-5][0-9])$');

      if (!timeRegExp.hasMatch(value)) {
        return 'Enter a valid time in the format hh:mm';
      }

      return null;
    });

    return this;
  }

  InputValidator paymentCardNumber() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'Card number cannot be empty';
      }

      final cleanedValue = value.replaceAll(RegExp(r'[\s-]'), '');

      if (!RegExp(r'^[0-9]{13,19}$').hasMatch(cleanedValue)) {
        return 'Enter a valid card number';
      }

      final digits = cleanedValue.split('').map(int.parse).toList();
      int sum = 0;
      bool alternate = false;

      for (int i = digits.length - 1; i >= 0; i--) {
        int digit = digits[i];

        if (alternate) {
          digit *= 2;
          if (digit > 9) {
            digit -= 9;
          }
        }

        sum += digit;
        alternate = !alternate;
      }

      if (sum % 10 != 0) {
        return 'Invalid card number';
      }

      return null;
    });

    return this;
  }

  InputValidator numeric() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'This field must be a number';
      }

      if (double.tryParse(value) == null) {
        return 'Enter a valid number';
      }

      return null;
    });

    return this;
  }

  InputValidator date({String format = 'YYYY-MM-DD'}) {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'Date cannot be empty';
      }

      final dateFormat = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$');
      if (!dateFormat.hasMatch(value)) {
        return 'Enter a valid date in the format $format';
      }

      return null;
    });
    return this;
  }

  InputValidator url() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'URL cannot be empty';
      }

      final urlRegExp = RegExp(
        r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
        caseSensitive: false,
        multiLine: false,
      );

      if (!urlRegExp.hasMatch(value)) {
        return 'Enter a valid URL';
      }

      return null;
    });

    return this;
  }

  InputValidator phoneNumber() {
    addValidator((value) {
      if (value == null || value.isEmpty) {
        return 'Phone number cannot be empty';
      }

      final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');

      if (!phoneRegExp.hasMatch(value)) {
        return 'Enter a valid phone number';
      }

      return null;
    });

    return this;
  }

  InputValidator addCustomValidator(ValidatorFn customValidator) {
    addValidator(customValidator);
    return this;
  }
}
