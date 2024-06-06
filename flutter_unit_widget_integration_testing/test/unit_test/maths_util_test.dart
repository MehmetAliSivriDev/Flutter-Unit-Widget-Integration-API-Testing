import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_widget_integration_testing/unit/maths_util.dart';

void main() {
  group("Maths Util -", () {
    test('Add Function Test', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var sum = add(a, b);

      //Assert
      expect(sum, 20);
    });

    test('Substract Function Test', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var subs = substract(a, b);

      //Assert
      expect(subs, 0);
    });

    test('Multiply Function Test', () {
      //Arrange
      var a = 10;
      var b = 10;

      //Act
      var mlt = multiply(a, b);

      //Assert
      expect(mlt, 100);
    });
  });
}
