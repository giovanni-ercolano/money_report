import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';
import '../providers/theme_provider.dart';
import '../services/screen_size.dart';

class LoginIconButtons extends StatelessWidget {
  const LoginIconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, model, child) {
        return Row(children: [
          Expanded(child: Container()),
          SignInButton.mini(
            buttonSize: ButtonSize.large,
            buttonType: model.isDarkMode ? ButtonType.apple : ButtonType.appleDark,
            onPressed: () {},
          ),
          SizedBox(width: ScreenSize.padding20),
          SignInButton.mini(
              buttonSize: ButtonSize.large,
              buttonType:
                  model.isDarkMode ? ButtonType.google : ButtonType.googleDark,
              onPressed: () {}),
          SizedBox(width: ScreenSize.padding20),
          SignInButton.mini(
            buttonType: model.isDarkMode ? ButtonType.github : ButtonType.githubDark,
            onPressed: () {},
            buttonSize: ButtonSize.large,
          ),
          Expanded(child: Container()),
        ]);
      },
    );
  }
}
