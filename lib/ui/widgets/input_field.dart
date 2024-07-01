import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_veflat/ui/theme.dart';

class InputField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final double? height;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? onlyNumbers;
  final bool? passwordField;
  final bool? emailField;
  final bool? readOnly;
  final double? fontSize;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final Function(String?)? onChange;
  final Function()? onTap;
  const InputField({
    super.key,
    required this.hint,
    this.textController,
    this.height,
    this.prefixIcon,
    this.sufixIcon,
    this.onlyNumbers,
    this.passwordField,
    this.emailField,
    this.readOnly,
    this.fontSize,
    this.validator,
    this.onChange,
    this.onTap,
    this.contentPadding,
    this.keyboardType,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.transparent),
          child: Center(
            child: TextFormField(
              onTap: widget.onTap,
              // enabled: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              onChanged: widget.onChange,
              style: widget.fontSize != null ? inputTextStyle.copyWith(fontSize: widget.fontSize) : inputTextStyle,
              textAlignVertical: TextAlignVertical.center,
              readOnly: widget.readOnly ?? false,
              autofocus: false,
              // cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
              controller: widget.textController,
              obscureText: widget.passwordField != null && widget.passwordField == true ? !_passwordVisible : false,
              // style: subTitleStyle,
              keyboardType: widget.onlyNumbers == true ? TextInputType.number : widget.keyboardType,
              inputFormatters: widget.onlyNumbers == true ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : [],
              decoration: InputDecoration(
                errorMaxLines: 2,
                errorStyle: subTitleSmallerTextStyle.copyWith(color: dangerClr, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: grey, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: grey, width:1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: dangerClr, width: 2),
                ),
                // hintStyle: inputStyle,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: dangerClr, width: 1),
                ),
                filled: true,
                fillColor: primaryBackgroundClr,
                isCollapsed: true,
                prefix: const Padding(padding: EdgeInsets.only(left: 15.0)),
                contentPadding: widget.contentPadding ?? const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0, left: 5),
                hintText: widget.hint,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.sufixIcon ??
                    (widget.passwordField != null && widget.passwordField == true
                        ? IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: darkGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            })
                        : null),

                // hintStyle: subTitleStyle
              ),
            ),
          ),
        ));
  }
}
