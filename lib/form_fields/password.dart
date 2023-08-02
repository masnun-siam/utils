import 'package:formz/formz.dart';
import 'package:utils/utils.dart';

enum PasswordValidationError { empty, weak, small }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.small;
    if (!value.isStrongPassword) return PasswordValidationError.weak;
    return null;
  }
}
