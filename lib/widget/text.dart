
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  double size;
  Color? color;
  TextOverflow textOverflow;

  BigText({super.key ,required this.text,
  this.size=30.0,
  this.color=const Color.fromARGB(255, 129, 198, 118),
  this.textOverflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
       maxLines: 1,
       style: TextStyle(
        fontSize: size,
        color: color,
        overflow: textOverflow
        
      ),
    );
  }
}

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  double size;
  Color? color;
  TextOverflow textOverflow;

  SmallText({super.key ,required this.text,
  this.size=20.0,
  this.color=Colors.black,
  this.textOverflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
       //maxLines: 1,
       style: TextStyle(
        fontSize: size,
        color: color,
        height: 1.3
       // overflow: textOverflow
      ),
    );
  }
}