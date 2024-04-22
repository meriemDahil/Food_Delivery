
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
      color: Colors.blue,
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
      height: 220,
      color: Colors.amber,

    );
  }
}
