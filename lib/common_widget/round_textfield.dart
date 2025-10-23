import 'package:flutter/material.dart';
import 'package:tracker/common/color_extension.dart';

class RoundTextfield extends StatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  const RoundTextfield({
    super.key,
    required this.title,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
  });

  @override
  State<RoundTextfield> createState() => _RoundTextfieldState();
}

class _RoundTextfieldState extends State<RoundTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: TColor.gray50, fontSize: 14),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: TColor.gray50),
            color: TColor.gray60.withOpacity(0.1),
          ),
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword,
            style: TextStyle(color: TColor.white),
            decoration: InputDecoration(
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintStyle: TextStyle(color: TColor.white.withOpacity(0.5)),
              labelStyle: TextStyle(color: TColor.white.withOpacity(0.5)),
            ),
          ),
        )
      ],
    );
  }
}
