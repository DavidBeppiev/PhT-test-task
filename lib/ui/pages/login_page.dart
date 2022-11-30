import 'package:fhysical_transformation/bloc/cubit/auth%20cubit/auth_cubit.dart';
import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/ui/pages/registration_page.dart';
import 'package:fhysical_transformation/ui/pages/result_page.dart';
import 'package:fhysical_transformation/ui/widgets/alerts/exit_from_app_warning_alert.dart';
import 'package:fhysical_transformation/ui/widgets/custom%20widgets/custom_default_button.dart';
import 'package:fhysical_transformation/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessful) {
          if(state.mode == AuthMode.login) {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultPage(imagePath: state.imagePath)));
          }
        }
        if (state is AuthError) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultPage(imagePath: state.imagePath)));
        }
      },
      child: GestureDetector(
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
                        flex: 1, child: Center(child: Text(MyStrings.signIn, style: MyStyles.tsCIronFS34))),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          TextFormWidget(
                            hintText: MyStrings.name,
                            textController: nameController,
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
                                const Text(
                                  MyStrings.dontHaveAcc,
                                  style: MyStyles.tsCLightningYellowFS18,
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      MyStrings.signUp,
                                      style: MyStyles.tsCBlueFS18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            CustomDefaultButton(
                              onPressed: () => BlocProvider.of<AuthCubit>(context)
                                  .validateAuth(_formKey, nameController.text, passwordController.text),
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
      ),
    );
  }
}
