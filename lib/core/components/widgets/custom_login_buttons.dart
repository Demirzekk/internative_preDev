import 'package:flutter/material.dart';

class CustomAuthButton {
  customAuthButton(
          {required String buttonTitle,
          required Color buttonTitleColor,
          required Icon buttonPrefixIcon,
          required Color buttonBackgroundColor,
          required VoidCallback onPressed,
          required BuildContext context}) =>
      InkWell(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: buttonBackgroundColor,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
             
              children: [
                buttonPrefixIcon,
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          buttonTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: buttonTitleColor, fontSize: 16),
                        )))
              ],
            )),
      );
}
