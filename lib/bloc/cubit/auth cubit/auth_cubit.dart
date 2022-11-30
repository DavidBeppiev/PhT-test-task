import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fhysical_transformation/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final String successfulImagePath = 'assets/images/im_successfully.png';
  final String errorImagePath = 'assets/images/im_error.png';

  void registration(GlobalKey<FormState> formKey, String name, String password, String email) async {
    if (formKey.currentState!.validate()) {
      var box = await Hive.openBox('myBox');
      User user = User(
        id: Random().nextInt(100),
        name: name,
        email: email,
        password: password,
      );
      box.add(user);
      emit(AuthSuccessful(imagePath: successfulImagePath, mode: AuthMode.registration));
    }
  }

  void validateAuth(GlobalKey<FormState> formKey, String name, String password) async {
    var box = await Hive.openBox('myBox');
    Map<dynamic, dynamic> raw = box.toMap();
    List list = raw.values.toList();
    if (formKey.currentState!.validate()) {
      for (int i = 0; i < list.length; i++) {
        User user = list[i];
        if (user.name == name) {
          if (user.password == password) {
            emit(AuthSuccessful(imagePath: successfulImagePath, mode: AuthMode.login));
            return;
          }
        }
      }
      emit(AuthError(imagePath: errorImagePath, mode: AuthMode.login));
    }
  }
}
