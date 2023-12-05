import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  final String? labelText;
  final Widget? suffixIcon;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: Align(
          alignment: Alignment.center,
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: suffixIcon,
        ),
      ),
      validator: validator,
    );
  }
}
