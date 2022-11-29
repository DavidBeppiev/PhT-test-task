import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/ui/pages/registration_page.dart';
import 'package:fhysical_transformation/ui/widgets/alerts/exit_from_app_warning_alert.dart';
import 'package:fhysical_transformation/ui/widgets/custom%20widgets/custom_default_button.dart';
import 'package:fhysical_transformation/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Expanded(
                      flex: 2, child: Center(child: Text(MyStrings.signIn, style: MyStyles.tsCIronFS34))),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        TextFormWidget(
                          hintText: MyStrings.loginNameEmail,
                          textController: loginController,
                          isPassword: false,
                        ),
                        TextFormWidget(
                          hintText: MyStrings.password,
                          textController: passwordController,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(MyStrings.dontHaveAcc, style: MyStyles.tsCLightningYellowFS18,),
                              const SizedBox(width: 3.0,),
                              InkWell(onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                              }, child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(MyStrings.signUp, style: MyStyles.tsCBlueFS18,),
                              ),)
                            ],
                          ),
                          const SizedBox(height: 7.0,),
                          CustomDefaultButton(
                            onPressed: () => auth(context),
                            text: MyStrings.next,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void auth(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('its OK')),
      );
    }
  }
}
