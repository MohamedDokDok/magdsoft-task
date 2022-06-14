import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.onSubmit,
    required this.node,
    required this.isObscure,
    required this.validate,
    required this.label,
    this.suffixIcon,
    this.suffixIconOnPress,
    required this.keyBoardType,
    required this.action,
  }) : super(key: key);

  final TextEditingController controller;
  final  Function() onSubmit;
  final FocusNode node;
  final bool isObscure;
  final FormFieldValidator<String> validate;
  final String label;
  IconData? suffixIcon;
  VoidCallback? suffixIconOnPress;
  final TextInputType keyBoardType;
  final TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        controller: controller,
        onEditingComplete: onSubmit,
        focusNode: node,
        textInputAction: action,
        obscureText: isObscure,
        validator: validate,
        maxLines: 1,
        scrollPhysics: const BouncingScrollPhysics(),
        keyboardType: keyBoardType,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          //labelText: label,
          label: Text(
            label,
            textDirection: TextDirection.ltr,
            locale: Locale('en'),
          ),
          hintTextDirection: TextDirection.ltr,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(19.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.gray,
            ),
            borderRadius: BorderRadius.circular(19.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.gray),
            borderRadius: BorderRadius.circular(19.0),
          ),
          suffixIcon: suffixIcon == null ? null : IconButton(
            icon: Icon(
              suffixIcon,
            ),
            onPressed: suffixIconOnPress,
          ),
        ),
      ),
    );
  }
}
