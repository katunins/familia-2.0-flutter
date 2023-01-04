import 'package:familia_flutter/components/bottomSheet.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/components/widgets/textFieldWidget.dart';

import 'package:familia_flutter/main.dart';
import 'package:familia_flutter/services/auth.service.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _prefs = GetIt.I<SharedPreferences>();

  var canSubmit = false;

  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    emailTextEditingController.text = _prefs.getString('email') ?? '';

    emailTextEditingController.addListener(updateCanSubmit);
    passwordTextEditingController.addListener(updateCanSubmit);

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
      await appStore.signIn(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text);
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
                  TextFieldWidget(
                    controller: emailTextEditingController,
                    hintText: 'email',
                    labelText: 'email',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFieldWidget(
                    controller: passwordTextEditingController,
                    hintText: 'Пароль',
                    labelText: 'Пароль',
                  ),
                ],
              ),
            ),
            AppButton(
              onPressed: _submit,
              type: IAppButtonTypes.primary,
              title: 'Войти',
              disabled: !canSubmit,
            )
          ],
        ));
  }
}
