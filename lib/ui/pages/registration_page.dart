import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:fhysical_transformation/ui/widgets/custom%20widgets/custom_default_button.dart';
import 'package:fhysical_transformation/ui/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    onPressed: () => auth(context),
                    text: MyStrings.signUp,
                  )),
          ],
        ),
            )),
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
