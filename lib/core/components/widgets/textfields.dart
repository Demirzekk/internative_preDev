import 'package:flutter/material.dart';

class TextFormFieldWidget {
  TextFormField emailTextFormField(
          {required TextEditingController controller,
          required Icon prefixEmailIcon,
          required String hintText}) =>
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Boş olamaz!';
          }

          return null;
        },
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          decorationColor: Colors.blueGrey,
        ),
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 2, color: Colors.black)),
            
            prefixIcon: prefixEmailIcon,
            enabledBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 1, color: Colors.black)),
            hintStyle: const TextStyle(
                color: Colors.blueGrey, fontSize: 14, letterSpacing: 1),
            hintText: hintText),
        maxLines: 1,
      );

  TextFormField passwordTextFormField(
          {required TextEditingController controller,
          required Icon prefixPasswordIcon,
          required IconButton suffixVisibleIcon,
          required String hintText}) =>
      TextFormField(
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Boş olamaz!';
          }

          return null;
        },
        controller: controller,
        
        style: const TextStyle(
          color: Colors.black,
          decorationColor: Colors.blueGrey,
        ),
        decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 2, color: Colors.black)),
            suffixIcon: suffixVisibleIcon,
            prefixIcon: prefixPasswordIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(width: 1, color: Colors.black)),
            labelStyle: const TextStyle(
              color: Colors.blueGrey,
            ),
             
            hintStyle: const TextStyle(
                color: Colors.blueGrey, fontSize: 14, letterSpacing: 1),
            hintText: hintText),
        maxLines: 1,
      );
}
