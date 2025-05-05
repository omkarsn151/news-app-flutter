import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;  
  final double? fontSize;  
  final FontWeight? fontWeight;  
  final TextAlign? textAlign;  
  final double? letterSpacing;  
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,  
    this.fontSize = 16.0,       
    this.fontWeight = FontWeight.normal, 
    this.textAlign = TextAlign.start, 
    this.letterSpacing = 0.0,  
    this.textDecoration,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(  
        color: color,  
        fontSize: fontSize,  
        fontWeight: fontWeight,  
        letterSpacing: letterSpacing, 
        decoration: textDecoration,
      ),
      textAlign: textAlign,  
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}