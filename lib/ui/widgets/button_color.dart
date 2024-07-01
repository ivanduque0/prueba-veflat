import 'package:flutter/material.dart';
import 'package:prueba_veflat/ui/theme.dart';

class ButtonColor extends StatelessWidget {
  final Color color;
  final bool? selected;
  final Function() onTap;
  const ButtonColor(
    {super.key, 
    required this.onTap, 
    required this.color,
    this.selected,
    }
  );
  //const MyButton({Key? key, required this.label, required this.onTap}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        height:60,
        width:60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected==true?white:color,
          border: Border.all(
            width: 11.0,
            color: color
          ),
        ),
        
      ),
    );
  }
}