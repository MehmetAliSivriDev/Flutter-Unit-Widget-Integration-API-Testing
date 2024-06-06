import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_widget_integration_testing/widget/login_view.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("Login Flow Test -", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Login Flow Test Email - Pass Unvalid",
        (WidgetTester widgetTester) async {
      //Arrange
      await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

      //Act
      Finder elevatedButton = find.byType(ElevatedButton);
      await widgetTester.tap(elevatedButton);
      await widgetTester.pumpAndSettle(const Duration(seconds: 2));
      Finder errorTexts = find.text("Required Field");

      //Assert
      expect(errorTexts, findsNWidgets(2));
    });

    testWidgets("Go to Home View when Email - Pass Valid",
        (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

      // Act
      Finder emailTextField = find.byKey(const ValueKey("email"));
      Finder passTextField = find.byKey(const ValueKey("password"));
      Finder loginButton = find.byType(ElevatedButton);

      await widgetTester.enterText(emailTextField, "correct@gmail.com");
      await widgetTester.enterText(passTextField, "12345678");

      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();

      Finder welcomeText = find.byType(Text);

      //Assert
      expect(welcomeText, findsOneWidget);
    });
  });
}
