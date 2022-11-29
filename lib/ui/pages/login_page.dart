import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/ui/widgets/alerts/exit_from_app_warning_alert.dart';
import 'package:fhysical_transformation/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          exitAppAlert(context);
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Expanded(
                    flex: 2, child: Center(child: Text(MyTexts.login, style: MyStyles.tsCIronFS34))),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      TextFormWidget(
                        hintText: MyTexts.loginInput,
                        textController: loginController,
                        isPassword: false,
                      ),
                      TextFormWidget(
                        hintText: MyTexts.password,
                        textController: passwordController,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
