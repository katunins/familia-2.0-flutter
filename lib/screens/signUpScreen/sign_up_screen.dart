import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/root/app_bar.dart';
import 'package:familia_flutter/screens/signUpScreen/sign_up_form.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import '../../themes/margins.theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const pathName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              constraints: maxWidthConstraints,
              margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Регистрация',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SignUpForm(),
                    AppButton(
                        title: 'Вернуться назад',
                        type: IAppButtonTypes.secondary,
                        onPressed: context.router.pop)
                  ]))),
    );
  }
}
