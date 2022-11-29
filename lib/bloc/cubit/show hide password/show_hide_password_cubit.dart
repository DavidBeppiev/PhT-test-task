import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_hide_password_state.dart';

class ShowHidePasswordCubit extends Cubit<bool> {
  ShowHidePasswordCubit() : super(true);

  void showPassword () => emit(false);
  void hidePassword () => emit(true);
}
