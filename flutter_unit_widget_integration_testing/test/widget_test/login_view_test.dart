import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_widget_integration_testing/widget/login_view.dart';

void main() {
  testWidgets("Login View AppBar Title Test -",
      (WidgetTester widgetTester) async {
    //Arrange
    await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

    //Act
    Finder title = find.text("Login");

    //Assert
    expect(title, findsOneWidget);
  });

  testWidgets("Login View Login Button Test (Should have one login button) -",
      (WidgetTester widgetTester) async {
    //Arrange
    await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

    //Act
    Finder elevatedButton = find.byType(ElevatedButton);

    //Assert
    expect(elevatedButton, findsOneWidget);
  });

  //GROUP--------------------------------------------------------------------------
  group("Login View Text Fields Test -", () {
    testWidgets("Login View Email Text Field Test -",
        (WidgetTester widgetTester) async {
      //Arrange
      await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

      //Act
      Finder emailTextField = find.byKey(const ValueKey("email"));

      //Assert
      expect(emailTextField, findsOneWidget);
    });

    testWidgets("Login View Password Text Field Test -",
        (WidgetTester widgetTester) async {
      //Arrange
      await widgetTester.pumpWidget(const MaterialApp(
        home: LoginView(),
      ));

      //Act
      Finder passTextField = find.byKey(const ValueKey("password"));

      //Assert
      expect(passTextField, findsOneWidget);
    });
  });

  //--------------------------------------------------------------------------

  //GROUP---------------------------------------------------------------------

  group("Text Fields Validators Test (Error Messages) -", () {
    testWidgets(
        "Text Fields Error Messages (Required Fields Message if Fields are Empty)",
        (WidgetTester widgetTester) async {
      //Arrange
      await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

      //Act
      Finder elevatedButton = find.byType(ElevatedButton);
      await widgetTester.tap(elevatedButton);
      await widgetTester.pumpAndSettle();
      Finder errorTexts = find.text("Required Field");

      //Assert
      expect(errorTexts, findsNWidgets(2));
    });

    testWidgets("Password Character Error (Error Message for Invalid)",
        (WidgetTester widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(const MaterialApp(home: LoginView()));

      // Act
      Finder passTextField = find.byKey(const ValueKey("password"));
      Finder elevatedButton = find.byType(ElevatedButton);

      await widgetTester.enterText(passTextField, 'pass');
      await widgetTester.tap(elevatedButton);
      await widgetTester.pumpAndSettle();

      Finder errorTexts =
          find.text("Please Enter at Least 8 Character for Password");

      // Assert
      expect(errorTexts, findsOneWidget);
    });
  });

  //--------------------------------------------------------------------------

  testWidgets("TextFields Validators Test (Valid) -",
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

    Finder errorTexts = find.text("Required Field");

    //Assert
    expect(errorTexts, findsNothing);
  });
}
