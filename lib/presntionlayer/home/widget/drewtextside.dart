
    import 'package:flutter/cupertino.dart';
import '../../../const/style.dart';
Widget drewText({var leftText,rightText}){
  return  Padding(
    padding: const EdgeInsets.only(top: 26, right: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: StyleApp.style1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
           rightText,
            style: StyleApp.styleBestSellers,
          ),
        ),
      ],
    ),
  );
}