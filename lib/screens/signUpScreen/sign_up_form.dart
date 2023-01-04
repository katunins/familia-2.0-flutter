import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/common/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/util.helper.dart';
import '../../stores/app.store.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var canSubmit = false;

  var emailTextEditingController = TextEditingController(text: '222@rr.ru');
  var passwordTextEditingController = TextEditingController(text: '12345678');
  var passwordDoubleTextEditingController = TextEditingController(text: '12345678');

  void updateCanSubmit() {
    setState(() {
      canSubmit = emailTextEditingController.text.isNotEmpty &&
          passwordTextEditingController.text.isNotEmpty &&
          passwordDoubleTextEditingController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    emailTextEditingController.addListener(updateCanSubmit);
    passwordTextEditingController.addListener(updateCanSubmit);
    passwordDoubleTextEditingController.addListener(updateCanSubmit);
    super.initState();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await appStore.signUp(
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
                    // onChanged: (_) => updateCanSubmit(),
                    labelText: 'email',
                    hintText: 'email',
                    validator: (value) =>
                        !isEmailFormat(value) ? 'Не верный формат email' : null,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                    controller: passwordTextEditingController,
                    // onChanged: (_) => updateCanSubmit(),
                    labelText: 'Пароль',
                    hintText: 'Пароль',
                    validator: (value) => (value != null && value.length < 8)
                        ? 'Длинна пароля не менее 8 символов'
                        : null,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFieldWidget(
                    controller: passwordDoubleTextEditingController,
                    // onChanged: (_) => updateCanSubmit(),
                    hintText: 'Пароль',
                    labelText: 'Повторите пароль',
                    validator: (value) =>
                        (value != passwordTextEditingController.text)
                            ? 'Длинна пароля не менее 8 символов'
                            : null,
                  ),
                ],
              ),
            ),
            AppButton(
              title: 'Зарегистрироваться',
              type: IAppButtonTypes.primary,
              onPressed: _submit,
              disabled: !canSubmit,
            )
          ],
        ));
  }
}
