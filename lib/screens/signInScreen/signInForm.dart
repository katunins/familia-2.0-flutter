import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:familia_flutter/main.dart';
import 'package:familia_flutter/services/auth.service.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  var canSubmit = false;

  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    emailTextEditingController.text = localStorage.read('email') ?? '';
    updateCanSubmit();
    super.initState();
  }

  void updateCanSubmit() {
    setState(() {
      canSubmit = emailTextEditingController.text.isNotEmpty &&
          passwordTextEditingController.text.isNotEmpty;
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      var tokens = await AuthService().signIn(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      if (tokens == null) {
        return;
      }
      appStore.setTokens(tokens);
      localStorage.write('email', emailTextEditingController.text);
      await appStore.initAuthApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    updateCanSubmit();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      suffixIcon: getRemoveSuffix(
                          onPressed: () {
                            emailTextEditingController.clear();
                            updateCanSubmit();
                          },
                          textEditingController: emailTextEditingController),
                    ),
                    onChanged: (value) {
                      updateCanSubmit();
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                        hintText: 'Пароль',
                        labelText: 'Пароль',
                        suffixIcon: getRemoveSuffix(
                            onPressed: () {
                              passwordTextEditingController.clear();
                              updateCanSubmit();
                            },
                            textEditingController:
                                passwordTextEditingController)),
                    onChanged: (value) {
                      updateCanSubmit();
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: canSubmit ? _submit : null,
              child: const Text('Войти'),
            )
          ],
        ));
  }
}
