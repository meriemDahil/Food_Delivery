
import 'package:flutter/material.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});

  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      //its necessary to add the height 
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPage(index);
        },
      ),
    );
  }
  Widget _buildPage(int index){
    return Container(
      
      margin: EdgeInsets.only(left:  5,right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.amber,),

    );
  }
}

///
///in order to run our app u should first execute the db