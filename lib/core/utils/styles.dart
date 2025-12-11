import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'assetes.dart';
import 'colors.dart';

TextStyle selectedMainMenuStyle = const TextStyle(
  color: colorSecondary,
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
);

TextStyle unselectedMainMenuStyle = const TextStyle(
  color: colorGreyLight,
  fontSize: 12.0,
  fontWeight: FontWeight.w400,
);

TextStyle labelTitleStyle = const TextStyle(
  fontFamily: 'Montserrat',
  color: colorDark,
  fontSize: 14,
  fontWeight: FontWeight.w700,
);
TextStyle optionalTextStyle = const TextStyle(
  color: colorDark,
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.italic,
);

TextStyle dropdownTextStyle = const TextStyle(
  color: colorDark,
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
);

TextStyle titleStyle = const TextStyle(
  color: colorJaguar,
  fontSize: 20.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
);

TextStyle subTitleStyle = const TextStyle(
  color: colorJaguar,
  fontSize: 18.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
);

TextStyle textFormFieldStyle = const TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
);

InputDecoration passwordInputDecoration({
  required GestureTapCallback togglePassword,
  required bool obscurePassword,
  required String hintText,
}) {
  return InputDecoration(
    hintText: hintText,
    errorMaxLines: 3,
    hintStyle: hintTextStyle,
    suffixIcon: InkWell(
      onTap: togglePassword,
      child: SvgPicture.asset(
        obscurePassword ? ICON_HIDE_PASSWORD : ICON_SHOW_PASSWORD,
        fit: BoxFit.none,
      ),
    ),
  );
}

BorderRadius borderRadius = const BorderRadius.all(
  Radius.circular(15.0),
);

TextStyle hintTextStyle = const TextStyle(
  fontSize: 14,
  color: colorGreyLight,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w400,
);

TextStyle valueTextStyle = const TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);

TextStyle requiredMarkStyle = const TextStyle(
  fontFamily: 'Montserrat',
  color: colorRed,
  fontSize: 14,
  fontWeight: FontWeight.w700,
);
TextStyle invalidInputStyle = const TextStyle(
  fontFamily: 'Montserrat',
  color: colorRed,
  fontSize: 12,
);

TextStyle contentStyle = const TextStyle(
  color: colorGreyLight,
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
);
TextStyle textButtonStyle = const TextStyle(
  color: colorBlue,
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  decoration: TextDecoration.underline,
);

TextStyle titlePrimaryW700 = const TextStyle(
  color: colorPrimary,
  fontSize: 14.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
);

TextStyle titlePrimaryW600 = const TextStyle(
  fontSize: 14,
  color: colorPrimary,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);
TextStyle contentTitleBigStyle = const TextStyle(
  fontSize: 14,
  color: colorDark,
  fontWeight: FontWeight.w600,
);
TextStyle contentSubTitleBigStyle = const TextStyle(
  fontSize: 12,
  color: colorGrey,
  fontWeight: FontWeight.w500,
);

TextStyle contentTitleStyle = const TextStyle(
  fontSize: 12,
  color: colorDark,
  fontWeight: FontWeight.w600,
);
