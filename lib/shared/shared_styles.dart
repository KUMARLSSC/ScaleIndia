import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables
const kBlack = Color(0xFF21202A);
const kBlackAccent = Color(0xFF3A3A3A);
const kSilver = Color(0xFFF6F6F6);
const kOrange = Color(0xFFFA5805);
var kPageTitleStyle = GoogleFonts.questrial(
  fontSize: 23.0,
  fontWeight: FontWeight.w500,
  color: kBlack,
  wordSpacing: 2.5,
);
var kTitleStyle = GoogleFonts.questrial(
  fontSize: 16.0,
  color: kBlack,
  fontWeight: FontWeight.w400,
);
var kSubtitleStyle = GoogleFonts.questrial(
  fontSize: 14.0,
  color: kBlack,
);
const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.white,fontSize: 17);
