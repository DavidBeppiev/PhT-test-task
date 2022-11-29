import 'package:fhysical_transformation/bloc/cubit/show%20hide%20password/show_hide_password_cubit.dart';
import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormWidget extends StatelessWidget {
  String hintText;
  TextEditingController textController;
  bool isPassword;

  TextFormWidget({required this.hintText, required this.textController, required this.isPassword, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: BlocProvider(
        create: (context) => ShowHidePasswordCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<ShowHidePasswordCubit, bool>(
            builder: (context, isHideState) {
              return TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return MyStrings.requiredField;
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(
                              isHideState ? Icons.remove_red_eye : Icons.visibility_off,
                              color: MyColors.lightningYellow,
                            ),
                            onPressed: () {
                              if (isHideState)
                                BlocProvider.of<ShowHidePasswordCubit>(context).showPassword();
                              else
                                BlocProvider.of<ShowHidePasswordCubit>(context).hidePassword();
                            },
                          )
                        : const SizedBox(),
                    label: Text(hintText),
                    labelStyle: MyStyles.tsCIronFS22,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColors.ironColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: MyColors.lightningYellow),
                    )),
                obscureText: isPassword && isHideState,
                cursorColor: MyColors.lightningYellow,
                controller: textController,
                style: MyStyles.tsCIronFS28,
              );
            },
          );
        }),
      ),
    );
  }
}
