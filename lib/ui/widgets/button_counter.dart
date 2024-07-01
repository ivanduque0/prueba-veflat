import 'package:flutter/material.dart';
import 'package:prueba_veflat/ui/theme.dart';

class ButtonCounter extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final Widget? icon;
  final Function() onTap;
  const ButtonCounter(
    {super.key, 
    required this.onTap, 
    this.color,
    this.textColor,
    this.borderColor,
    this.width,
    this.fontSize,
    this.height,
    this.icon
    }
  );
  //const MyButton({Key? key, required this.label, required this.onTap}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        height:height??60,
        width:height??60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color??primaryClr,
          border: Border.all(
            width: 2.0,
            color: borderColor??Colors.transparent
          ),
        ),
        child: Center(
            child: icon 
            ),
      ),
    );
  }
}