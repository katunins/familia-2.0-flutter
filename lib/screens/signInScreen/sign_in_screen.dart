import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/screens/signInScreen/sign_in_form.dart';

import 'package:flutter/material.dart';

import '../../themes/sizes.dart';
import '../signUpScreen/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static const pathName = '/signIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: AppSizes.maxWidthConstraints,
          margin: EdgeInsets.symmetric(horizontal: AppSizes.marginHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Вход в аккаунт',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SignInForm(),
              AppButton(
                  title: 'Создать новый аккаунт',
                  type: IAppButtonTypes.secondary,
                  onPressed: () =>
                      context.router.pushNamed(SignUpScreen.pathName))
            ],
          ),
        ));
  }
}
