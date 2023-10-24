import 'package:clean_architeture_project/core/constants/errors/validators_errors.dart';
import 'package:clean_architeture_project/core/mixins/validators_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ValidationTestClass mixin;

  setUp(() {
    mixin = ValidationTestClass();
  });

  group('Required validation', () {
    test('Should return an error message when field is null', () {
      final String? result = mixin.requiredValidator(null);

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test('Should return an error message when field is empty', () {
      final String? result = mixin.requiredValidator('');

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test('Should return a null value when field is filled', () {
      final String? result = mixin.requiredValidator('fsafsdvsfa');

      expect(result, isNull);
    });
  });

  group('E-mail validation', () {
    test('Should return an error message when field is null', () {
      final String? result = mixin.emailValidator(null);

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test('Should return an error message when field is empty', () {
      final String? result = mixin.emailValidator('');

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test('Should return an error message when email is invalid', () {
      final String? result = mixin.emailValidator('teste@');

      expect(result, equals(ValidatorsErrors.invalidEmail.message));
    });

    test('Should return a null value when email is correct', () {
      final String? result = mixin.emailValidator('teste@teste.com');

      expect(result, isNull);
    });
  });

  group('Password confirmation validation', () {
    test('Should return an error message when field is null', () {
      final String? result = mixin.passwordConfirmationValidator(null, '12345');

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test('Should return an error message when field is empty', () {
      final String? result = mixin.passwordConfirmationValidator('', '12345');

      expect(result, equals(ValidatorsErrors.emptyField.message));
    });

    test(
        'Should return an error message when password and the confirmation are different',
        () {
      final String? result =
          mixin.passwordConfirmationValidator('teste@', '12345');

      expect(result, equals(ValidatorsErrors.passwordsAreNotEqual.message));
    });

    test(
        'Should return a null value when password and the confirmation are the same',
        () {
      final String? result =
          mixin.passwordConfirmationValidator('12345', '12345');

      expect(result, isNull);
    });
  });
}

class ValidationTestClass with ValidatorsMixin {}
