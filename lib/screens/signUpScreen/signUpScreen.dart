import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/components/widgets/scaffoldWrapper.dart';
import 'package:familia_flutter/screens/signUpScreen/signUpForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../themes/margins.theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                        onPressed: Navigator.of(context).pop)
                  ]))),
    );
  }
}
