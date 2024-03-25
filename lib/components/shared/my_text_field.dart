import 'package:flutter/material.dart';

import '../constant/them.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Color? color;
  final Color? borderColre;
  final String? hint;
  final String? labe;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? isPass;
  final int? maxLine;

  const MyTextField(
      {super.key,
      this.controller,
      this.color,
      this.borderColre,
      this.hint,
      this.labe,
      this.icon,
      this.validator,
      this.keyboardType,
      this.isPass,
      this.maxLine});

  @override
  State<MyTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<MyTextField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: widget.maxLine,
        obscureText: widget.isPass != null ? hide : false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.validator,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 2,
            color: MyThem.black),
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: MyThem.grey),
            labelText: widget.labe,
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: MyThem.primaryColor,
                  )
                : null,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: widget.borderColre ?? MyThem.accentColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyThem.secondaryColor, width: 2),
                borderRadius: BorderRadius.circular(5)),
            fillColor: widget.color ?? MyThem.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            suffix: widget.isPass != null
                ? InkWell(
                    onTap: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    child: hide
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null));
  }
}
