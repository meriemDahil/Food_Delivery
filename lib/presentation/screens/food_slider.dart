
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/color.dart';
import 'package:food_delivery/widget/reusable_icon_text_widget.dart';
import 'package:food_delivery/widget/text.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});


  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
 // PageView.builder has controller we are using it to show a littlebit of the previous and next pageview
  PageController  pageController=PageController(viewportFraction: 0.85);
  var _currentPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=240;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue=pageController.page!;
        //print("current value is "+_currentPageValue.toString());
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }
  
  @override
  
  Widget build(BuildContext context) {
    return  Container(
      height: 320,
      //its necessary to add the height 
      //color: Colors.deepPurple,
      //every page has index and page value 
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
    Matrix4 matrix =new Matrix4.identity();
    if (index == _currentPageValue.floor()){
      var currScale =1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);

    }else if(index==_currentPageValue.floor()+1){
      var currScale =_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
       var currTrans= _height*(1-currScale)/2;
       matrix =Matrix4.diagonal3Values(1, currScale, 1);
       matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // this container takes the size of it parent container 
            // to make take it supposed size we  wrap it in a stack 
            height: 240,
            margin: EdgeInsets.only(left:  10,right: 10),
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
                    ),
                    SizedBox(width: 10,),
                    SmallText(text: '3.5k'),
                    SizedBox(width: 10,),
                    SmallText(text: '128 comments')              
                  ],
                ),
                SizedBox(height: 20,),
                Row(children: [
                  IconText(icon: Icons.circle_sharp, text: 'Normal',iconColor: Color.fromARGB(255, 219, 133, 21)),
                  IconText(icon: Icons.location_on, text: 'Location ',iconColor: Color.fromARGB(255, 121, 167, 81)),
                  IconText(icon: Icons.access_time_rounded, text: '23min',iconColor: Color.fromARGB(255, 243, 50, 33)),
      
                ],)
      
              ],),
            ),
            
            ),
          )
        ],
      ),
    );
  }
}

///
///in order to run our app u should first execute the db