import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color fillColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isSearch;
  final  Color iconColor;
  final bool isPrefixIcon;

  CustomTextFormField({
    Key? key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.borderColor = AppColors.borderColor,
    this.focusedBorderColor = const Color(0xFF3F80FF),
    this.errorBorderColor = const Color(0xFFFF3B30),
    this.fillColor = AppColors.textFormFieldBackground,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.contentPadding,
    this.suffixIcon,
    this.isSearch = false,
    this.iconColor = AppColors.iconColor,
    this.isPrefixIcon = true
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText=widget.isPassword;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.isPrefixIcon?
        widget.prefixIcon:
        null,
        suffixIcon: widget.isSearch?
            null
            :widget.isPassword ?
        GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: _obscureText ? Icon(Icons.visibility) : Icon(
                Icons.visibility_off))
            : null
            ,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF666666),
        ),
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF999999),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: widget.borderWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: widget.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
            width: widget.borderWidth + 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.errorBorderColor,
            width: widget.borderWidth,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.errorBorderColor,
            width: widget.borderWidth + 1,
          ),
        ),
        fillColor: widget.fillColor,
        filled: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(
          horizontal: 14,

        ),
      ),
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF000000),
      ),
      cursorColor: widget.focusedBorderColor,
    );
  }
}