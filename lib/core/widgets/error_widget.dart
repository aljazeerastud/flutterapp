import 'package:flutter/material.dart';
import 'package:awa/core/constant/styles/text_styles.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          // child: Lottie.asset(AppLotties.error, fit: BoxFit.contain)
        ),
        SizedBox(
          width: 300,
          child: Text(
            message,
            style: TextStyles.textViewBold20,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}