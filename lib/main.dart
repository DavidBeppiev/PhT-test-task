import 'package:fhysical_transformation/bloc/providers.dart';
import 'package:fhysical_transformation/data/models/user_model.dart';
import 'package:fhysical_transformation/ui/pages/login_page.dart';
import 'package:fhysical_transformation/data/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: MyColors.sharkColor),
        home: LoginPage(),
      ),
    );
  }
}
