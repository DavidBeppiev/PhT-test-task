import 'package:fhysical_transformation/data/constants/my_strings.dart';
import 'package:fhysical_transformation/data/constants/my_styles.dart';
import 'package:fhysical_transformation/ui/widgets/custom%20widgets/custom_alert_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_dialogs/material_dialogs.dart';

void exitAppAlert(BuildContext context) {
  Dialogs.materialDialog(
    titleStyle: MyStyles.tsCSharkFS26,
    color: Colors.white,
    titleAlign: TextAlign.center,
    title: MyStrings.confirmToExitApp,
    lottieBuilder: Lottie.asset(
      'assets/animations/an_alert.json',
      fit: BoxFit.contain,
    ),
    context: context,
    actions: [
      Row(
        children: [
          Expanded(
              child: MyCustomAlertButton(
            onPressed: () => SystemNavigator.pop(),
            text: MyStrings.yes,
          )),
          const SizedBox(
            width: 7.0,
          ),
          Expanded(child: MyCustomAlertButton(onPressed: () => Navigator.pop(context), text: MyStrings.no))
        ],
      )
    ],
  );
}
