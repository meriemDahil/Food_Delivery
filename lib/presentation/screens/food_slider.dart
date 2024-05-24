
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});


  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 320,
      //its necessary to add the height 
      // color: Colors.deepPurple,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPage(index);
        },
      ),
    );
  }
  Widget _buildPage(int index){
    return Stack(
      children: [
        Container(
          // this container takes the size of it parent container 
          // to make take it supposed size we  wrap it in a stack 
          height: 240,
          margin: EdgeInsets.only(left:  15,right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.amber,
            image:DecorationImage(
              image:AssetImage('assets/Recipe idea Conchiglioni with ricotta and petits pois.jpeg') ,
              fit:BoxFit.cover,
              
              ),
              
        
        ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 40,right: 40,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
             
          
          ),
          
          ),
        )
      ],
    );
  }
}

///
///in order to run our app u should first execute the db