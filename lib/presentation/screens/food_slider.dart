
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/color.dart';
import 'package:food_delivery/widget/reusable_icon_text_widget.dart';
import 'package:food_delivery/widget/text.dart';


//"carousel" effect, where the current page is larger, nd the previous nd next pages are slightly visible nd smaller.
class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});


  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
 // viewportFraction: 0.85 means that each page takes up 85% of the viewport width, allowing a bit of the previous and next pages to be visible.
  PageController  pageController=PageController(viewportFraction: 0.85);
  var _currentPageValue=0.0; // Tracks the current page position.
  double _scaleFactor=0.8; // Determines how much smaller the non-current pages are.
  double _height=240; // The height of each page.
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
    
    Matrix4 matrix =new Matrix4.identity();//Creates an identity matrix, which doesn't alter the widget by default.
    //Current Page (index == _currentPageValue.floor()):
    if (index == _currentPageValue.floor()){
      var currScale =1-(_currentPageValue-index)*(1-_scaleFactor); 
      //Calculates the scale factor for the current page. The closer _currentPageValue is to index, the closer currScale will be to 1 (no scaling).
      //the formula simplifies to 1 - 0 * (1 - _scaleFactor), resulting in currScale close to 1 (full size).
      var currTrans= _height*(1-currScale)/2; //currTrans == 0 since  currScale ==1 
      matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);

    }
    // next page (index == _currentPageValue.floor()):
    else if(index==_currentPageValue.floor()+1){
      var currScale =_scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      // Calculates the scale factor for the next page. As the next page becomes the current page,
      // it scales up from _scaleFactor to 1.
      // When the next page is far from becoming the current page,
      // (_currentPageValue - index + 1) is closer to 0, and currScale approaches _scaleFactor.
      // The formula simplifies to _scaleFactor + (1) * (1 - _scaleFactor), resulting in currScale close to 1 (full size).
       var currTrans= _height*(1-currScale)/2;
       matrix =Matrix4.diagonal3Values(1, currScale, 1);
       matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);

    }
    // Previous Page (index == _currentPageValue.floor() - 1):
    else if(index==_currentPageValue.floor()-1){
       var currScale =1-(_currentPageValue-index)*(1-_scaleFactor);
      // currScale: Calculates the scale factor for the previous page. 
      //As the previous page moves away from being the current page, it scales down from 1 to _scaleFactor.
      //he formula simplifies to 1 - 1 * (1 - _scaleFactor), resulting in currScale close to _scaleFactor (minimum scale).
       var currTrans= _height*(1-currScale)/2;
       matrix =Matrix4.diagonal3Values(1, currScale, 1);
       matrix =Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans , 0);

    }
    else{
      var currScale =0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
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
/*
The Matrix4 class is part of the vector_math library and represents a 4x4 matrix, which is commonly used 
for 3D transformations in graphics programming. In Flutter, it's often used for 2D transformations as well.
example for scalling :
Matrix4.diagonal3Values(double x, double y, double z)
Transform(
  transform: Matrix4.diagonal3Values(1.5, 1.5, 1.0),
  child: Container(
    color: Colors.green,
    width: 100,
    height: 100,
  ),
);
Calculating (_currentPageValue - index + 1)

///Current Page: When _currentPageValue is exactly on a page (say 1.0), index for the next page would be 2.

_currentPageValue = 1.0;
index = 2;
_currentPageValue - index + 1 = 1.0 - 2 + 1 = 0.0;
 Here, the next page's scale factor is at its minimum because it's not yet transitioning.

://Transitioning Page: When _currentPageValue is halfway between two pages (say 1.5), index for the next page is still 2.

_currentPageValue = 1.5;
index = 2;
_currentPageValue - index + 1 = 1.5 - 2 + 1 = 0.5;
Here, the next page's scale factor is halfway between the minimum and maximum because it's halfway into the transition.

////Next Page as Current: When _currentPageValue is just reaching the next page (say 1.99), index for the next page is still 2.

_currentPageValue = 1.99;
index = 2;
_currentPageValue - index + 1 = 1.99 - 2 + 1 = 0.99;
Here, the next page's scale factor is almost at its maximum because it's almost the current page.

    Current Page:
        currScale is close to 1 (full size).

    Previous Page:
        currScale scales down from 1 to _scaleFactor.

    Next Page:
        currScale scales up from _scaleFactor to 1.

.floor() return the integer part

 */