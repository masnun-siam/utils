import 'package:formz/formz.dart';
import 'package:utils/utils.dart';

enum PhoneValidationError { empty, invalid }

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('');

  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    if (value.isEmpty) return PhoneValidationError.empty;
    if (value.length < 10) return PhoneValidationError.invalid;
    if (!value.isPhone) {
      return PhoneValidationError.invalid;
    }
    return null;
  }
}