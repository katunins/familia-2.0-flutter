import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/components/widgets/linkButton.dart';
import 'package:familia_flutter/screens/signInScreen/signInForm.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../signUpScreen/signUpScreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: Container(
        constraints: maxWidthConstraints,
        margin: marginHorizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вход в аккаунт',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SignInForm(),
            const SizedBox(
              height: 20.0,
            ),
            getLinkButton(
                text: 'Зарегистрироваться',
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName))
          ],
        ),
      ),
    ));
  }
}
