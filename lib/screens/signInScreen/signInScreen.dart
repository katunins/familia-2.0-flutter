import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/screens/signInScreen/signInForm.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: maxWidthConstraints,
          margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Вход в аккаунт',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SignInForm(),
              AppButton(
                  title: 'Зарегистрироваться',
                  type: IAppButtonTypes.secondary,
                  onPressed: () => context.router.pushNamed('/signUp'))
            ],
          ),
        ));
  }
}
