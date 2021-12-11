import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

deleteAlert({context, String? text, VoidCallback? function}) {
  Alert(
    image: Icon(
      Icons.warning,
      color: Theme.of(context).errorColor,
      size: 50,
    ),
    style: AlertStyle(
      backgroundColor: AppColors.background,
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      //descStyle: GoogleFonts.poppins(color: Colors.red,),
      animationDuration: Duration(milliseconds: 300),
      titleStyle: GoogleFonts.poppins(
        color: AppColors.heading,
        fontSize: 18,
      ),
    ),
    context: context,
    title: text,
    buttons: [
      DialogButton(
        child: Text(
          "Não",
          style: GoogleFonts.montserrat(
            color: AppColors.heading,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          Modular.to.pop();
        },
        width: 80,
        color: AppColors.primary,
      ),
      DialogButton(
        child: Text(
          "Sim",
          style: GoogleFonts.montserrat(
            color: AppColors.heading,
            fontSize: 18,
          ),
        ),
        onPressed: function,
        width: 80,
        color: AppColors.stroke,
      )
    ],
  ).show();
}
