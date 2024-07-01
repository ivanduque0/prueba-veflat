import 'package:flutter/material.dart';
import 'package:prueba_veflat/ui/theme.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final Function() onTap;
  const Button(
    {super.key, 
    required this.label, 
    required this.onTap, 
    this.color,
    this.textColor,
    this.borderColor,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    }
  );
  //const MyButton({Key? key, required this.label, required this.onTap}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        height:height??60,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius??15),
          color: color??primaryClr,
          border: Border.all(
            width: 1.0,
            color: borderColor??Colors.transparent
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(label,
            textAlign: TextAlign.center,
              style: buttonTextStyle.copyWith(
                fontSize: fontSize??20,
                color: textColor??white
              )
            ),
          ),
        ),
      ),
    );
  }
}