import 'package:flutter/material.dart';
import 'package:flutter_unit_widget_integration_testing/unit/validator.dart';
import 'package:flutter_unit_widget_integration_testing/widget/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) => Validator.validateEmail(value ?? ""),
                    controller: _emailController,
                    key: const ValueKey("email"),
                    decoration:
                        const InputDecoration(hintText: "Email Text Field"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) =>
                        Validator.validatePassword(value ?? ""),
                    controller: _passController,
                    key: const ValueKey("password"),
                    decoration:
                        const InputDecoration(hintText: "Password Text Field"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeView()));
                        }
                      },
                      child: const Text("Let's Start")),
                )
              ],
            ),
          ),
        ));
  }
}
