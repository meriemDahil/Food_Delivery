
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/color.dart';
import 'package:food_delivery/widget/text.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});


  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
 // PageView.builder has controller we are using it to show a littlebit of the previous and next pageview
  PageController  pageController=PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 320,
      //its necessary to add the height 
      // color: Colors.deepPurple,
      child: PageView.builder(
        controller: pageController,
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
            margin: EdgeInsets.only(left: 30,right: 30,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 15,left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              BigText(text: 'Conchiglioni'),
              SizedBox(height: 10,),
              Row(
                children: [
                  Wrap(
                    //List.generate is used to create list of children it takes a lengh and return a function which can be an widget
                    children: List.generate(5, (index) =>Icon( Icons.star,color: AppColors.mainColor,size: 15,)),
                  )
                ],
              )

            ],),
          ),
          
          ),
        )
      ],
    );
  }
}

///
///in order to run our app u should first execute the db