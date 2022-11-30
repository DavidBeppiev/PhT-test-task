import 'package:fhysical_transformation/bloc/cubit/auth%20cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders{
  static final List<BlocProvider> providers = [
    BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
  ];
}