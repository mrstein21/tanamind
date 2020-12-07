import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontRoboto(double size, FontWeight bold, Color color){
  return GoogleFonts.roboto(
    fontSize: size,
    fontWeight: bold,
    color: color
  );
}

TextStyle fontMonsserat(double size, FontWeight bold, Color color){
  return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: bold,
      color: color
  );
}