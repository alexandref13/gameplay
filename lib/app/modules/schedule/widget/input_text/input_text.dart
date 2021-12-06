import 'package:flutter/material.dart';
import 'package:gameplay/app/theme/app_colors.dart';
import 'package:gameplay/app/theme/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24),
      width: 64,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.shapeBoxes,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLength: 2,
        keyboardType: TextInputType.number,
        style: TextStyles.text15,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
