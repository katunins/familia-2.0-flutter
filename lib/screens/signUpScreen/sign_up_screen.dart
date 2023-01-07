import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/screens/signUpScreen/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../themes/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const pathName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              constraints: AppSizes.maxWidthConstraints,
              margin: EdgeInsets.symmetric(horizontal: AppSizes.marginHorizontal),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Создание аккаунта',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SignUpForm(),
                    AppButton(
                        title: 'Вернуться к входу',
                        type: IAppButtonTypes.secondary,
                        onPressed: context.router.pop)
                  ]))),
    );
  }
}
