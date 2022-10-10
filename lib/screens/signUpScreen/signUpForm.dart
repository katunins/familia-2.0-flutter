import 'package:familia_flutter/components/widgets/textFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  TextFieldWidget(
                      controller: emailTextEditingController,
                      onChanged: (_) => updateCanSubmit(),
                      labelText: 'email',
                    hintText: 'email',
                    validator: (value) => !isEmailFormat(value) ? 'Не верный формат email' : null,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                    controller: passwordTextEditingController,
                    onChanged: (_) => updateCanSubmit(),
                    labelText: 'Пароль',
                    hintText: 'Пароль',
                    validator: (value) => (value != null && value.length < 8) ? 'Длинна пароля не менее 8 символов' : null,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFieldWidget(
                    controller: passwordDoubleTextEditingController,
                    onChanged: (_) => updateCanSubmit(),
                    hintText: 'Пароль',
                    labelText: 'Повторите пароль',
                    validator: (value) => (value != passwordTextEditingController.text) ? 'Длинна пароля не менее 8 символов' : null,
                  ),
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
