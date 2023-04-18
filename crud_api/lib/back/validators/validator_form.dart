//TODO add more validators!
// * CPF/CNPJ - phone number - etc

/// Custom Validator Class for Form-Field Components
///
/// In order to be used, the [validatorLexicom] must be used first,
/// then listing all the desired validators. The validation will be
/// prioritized from first to last, one at a time.
class ValidatorForm {
  // TODO change/integrate in other Validators
  // TODO add default validator text attribute
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Fill the camp';
    }
    return null;
  }

  // ? perfect?
  static String? validateEmail(String? value) {
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // TODO set a better name/fragment into more functions
  // TODO add size attribute
  static String? validateSize(String? value) {
    if (!RegExp(r"^[a-zA-Z0-9]{3}$").hasMatch(value!)) {
      return 'Too Short';
    }

    return null;
  }

  // ! validators aren't working with components
  // ? change anything?
  static String? validatorLexicom(List<String?> lexicom) {
    for (var i = 0; i < lexicom.length; i++) {
      String? response = lexicom[i];
      if (response != null) {
        return response;
      }
    }
    return null;
  }
}
