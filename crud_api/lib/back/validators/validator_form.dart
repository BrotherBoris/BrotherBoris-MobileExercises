//TODO add more validators!
// * CPF/CNPJ - phone number - etc

import 'package:flutter/material.dart';

/// Custom Validator Class for Form-Field Components
///
/// In order to be used, the [combinedValidator] must be used first
/// in the widget, then list all the desired validators in the component constructor.
/// The validation will be prioritized from first to last, one at a time.
class ValidatorForm {
  /// Implement in the widget for use of multiple validators
  static String? Function(String?)? combinedValidator(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  /// Require a value that isn't null or empty
  // TODO change/integrate in other Validators
  static String? Function(String?) validateEmpty({String defaultMessage = "Enter the field"}) {
    return (value) {
      if (value == null || value.isEmpty) {
        return defaultMessage;
      }
      return null;
    };
  }

  // ? change anything?
  /// Require the vale to follow the structure [name][@][adress].[adress]
  static String? Function(String?) validateEmail() {
    return (value) {
      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
        return 'Enter a valid email address';
      }
      return null;
    };
  }

  /// Require the value to follow the structure [000].[000].[000]-[00]
  static String? Function(String?) validateCPF() {
    return (value) {
      if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$').hasMatch(value!)) {
        return 'Enter a valid CPF';
      }
      return null;
    };
  }

  static String? Function(String?) validateIntNonNegative({String defaultMessage = "Enter a valid number"}) {
    return (value) {
      if (int.tryParse(value!) == null) {
        return defaultMessage;
      }
      if (int.tryParse(value)! < 0) {
        return defaultMessage;
      }
      return null;
    };
  }

  static String? Function(String?) validateDoubleNonNegative({String defaultMessage = "Enter a valid number"}) {
    return (value) {
      if (double.tryParse(value!) == null) {
        return defaultMessage;
      }
      if (double.tryParse(value)! < 0) {
        return defaultMessage;
      }
      return null;
    };
  }

  // * old method
/*   static String? validatorLexicom(List<String?> lexicom) {
    for (var i = 0; i < lexicom.length; i++) {
      String? response = lexicom[i];
      if (response != null) {
        return response;
      }
    }
    return null;
  } */
}
