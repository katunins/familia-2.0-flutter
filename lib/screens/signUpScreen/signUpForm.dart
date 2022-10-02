import 'package:familia_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/widgets/removeSuffix.dart';
import '../../helpers/util.helper.dart';
import '../../services/auth.service.dart';
import '../../stores/app.store.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var canSubmit = false;

  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();
  var passwordDoubleTextEditingController = TextEditingController();

  void updateCanSubmit() {
    setState(() {
      canSubmit = emailTextEditingController.text.isNotEmpty &&
          passwordTextEditingController.text.isNotEmpty &&
          passwordDoubleTextEditingController.text.isNotEmpty;
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      var tokens = await AuthService().signUp(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
      if (tokens == null) {
        return;
      }
      appStore.setTokens(tokens);
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
                    validator: (value) {
                      if (!isEmailFormat(value)) {
                        return 'Не верный формат email';
                      }
                    },
                    onChanged: (value) {
                      updateCanSubmit();
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
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
                    validator: (value) {
                      if (value != null && value.length < 8) {
                        return 'Длинна пароля не менее 8 символов';
                      }
                    },
                    onChanged: (value) {
                      updateCanSubmit();
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: passwordDoubleTextEditingController,
                    decoration: InputDecoration(
                        hintText: 'Пароль',
                        labelText: 'Повторите пароль',
                        suffixIcon: getRemoveSuffix(
                            onPressed: () {
                              passwordDoubleTextEditingController.clear();
                              updateCanSubmit();
                            },
                            textEditingController:
                                passwordDoubleTextEditingController)),
                    validator: (value) {
                      if (value != passwordTextEditingController.text) {
                        return 'Пароли не совпадают';
                      }
                    },
                    onChanged: (value) {
                      updateCanSubmit();
                    },
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: canSubmit ? _submit : null,
              child: const Text('Зарегистрироваться'),
            )
          ],
        ));
  }
}
