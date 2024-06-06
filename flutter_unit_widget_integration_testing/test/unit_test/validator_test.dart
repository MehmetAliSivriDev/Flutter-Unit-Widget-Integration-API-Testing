import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_widget_integration_testing/unit/validator.dart';

void main() {
  group("Email Validator Test -", () {
    test('Validate for Empty Email ID', () {
      //Arrange & Act
      var result = Validator.validateEmail('');

      //Assert
      expect(result, "Required Field");
    });

    test('Validate for Invalid Email ID', () {
      //Arrange & Act
      var result = Validator.validateEmail('asdfasd');

      //Assert
      expect(result, "Please Enter a Valid Email ID");
    });

    test('Validate for Valid Email ID', () {
      //Arrange & Act
      var result = Validator.validateEmail('abc@gmail.com');

      //Assert
      expect(result, null);
    });
  });

  group("Password Validator Test -", () {
    test('Validate for Empty Password', () {
      //Arrange & Act
      var result = Validator.validatePassword('');

      //Assert
      expect(result, "Required Field");
    });

    test('Validate for Invalid Password', () {
      //Arrange & Act
      var result = Validator.validatePassword('pass');

      //Assert
      expect(result, "Please Enter at Least 8 Character for Password");
    });

    test('Validate for Valid Password', () {
      //Arrange & Act
      var result = Validator.validatePassword('password');

      //Assert
      expect(result, null);
    });
  });
}
