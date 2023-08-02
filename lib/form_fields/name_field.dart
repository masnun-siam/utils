import 'package:formz/formz.dart';

enum NameValidationError { empty, invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    if (value.length < 3) return NameValidationError.invalid;
    if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$").hasMatch(value)) {
      return NameValidationError.invalid;
    }
    return null;
  }
}
