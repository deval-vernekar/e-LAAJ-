import 'package:flutter/material.dart';
// set constant config here
class Config
{
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  
  void init(BuildContext context)
  {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.width;
    screenWidth = mediaQueryData!.size.height;
  }
  static get widthSize
  {
    return screenWidth;
  }
  static get heightSize
  {
    return screenHeight;
  }

  // define spacing height
  static const spaceSmall = SizedBox(height: 25,);

  static final spaceMedium = SizedBox(height: screenHeight!*0.05,);
  static final spaceBig= SizedBox(height: screenHeight!*0.08,);

  //textform field border
static const outlinedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

static const focusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:  BorderSide(
        color: Colors.indigoAccent,
));
  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide:  BorderSide(
        color: Colors.red,
      ));
  static const primaryColor = Colors.indigoAccent;







}