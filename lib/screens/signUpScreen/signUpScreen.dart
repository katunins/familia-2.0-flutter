import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/screens/signUpScreen/signUpForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/widgets/linkButton.dart';
import '../../themes/margins.theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const routeName = '/signUpScreen';

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
                        'Регистрация',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SignUpForm(),
                      const SizedBox(
                        height: 16.0,
                      ),
                      getLinkButton(
                          text: 'Вернуться назад',
                          onPressed: Navigator.of(context).pop)
                    ]))));
  }
}
