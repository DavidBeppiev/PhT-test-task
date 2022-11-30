import 'package:fhysical_transformation/bloc/cubit/auth%20cubit/auth_cubit.dart';
import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:fhysical_transformation/ui/pages/login_page.dart';
import 'package:fhysical_transformation/ui/pages/result_page.dart';
import 'package:fhysical_transformation/ui/widgets/custom%20widgets/custom_default_button.dart';
import 'package:fhysical_transformation/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessful) {
          if (state.mode == AuthMode.registration) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(MyStrings.successfulRegistration)),
            );
            Future.delayed(const Duration(milliseconds: 600), () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false);
            });
          }
        }
        if (state is AuthError) {
          if(state.mode == AuthMode.registration) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ResultPage(imagePath: state.imagePath)));
          }
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
              child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Expanded(
                    flex: 1, child: Center(child: Text(MyStrings.signUp, style: MyStyles.tsCIronFS34))),
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
                        hintText: MyStrings.email,
                        textController: emailController,
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
                    child: CustomDefaultButton(
                      onPressed: () => BlocProvider.of<AuthCubit>(context).registration(
                          _formKey, nameController.text, passwordController.text, emailController.text),
                      text: MyStrings.signUp,
                    )),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
