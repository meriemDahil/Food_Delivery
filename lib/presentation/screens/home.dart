import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/presentation/bloc/internet_bloc.dart';
import 'package:food_delivery/presentation/screens/food_slider.dart';
import 'package:food_delivery/widget/rounded_btn.dart';
import 'package:food_delivery/widget/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is ConnectedState){
          return
           Scaffold(
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: 'Country'),
                          Row(
                            children: [
                              SmallText(text: 'city'),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ),
                        ],
                      ),
                      RoundedButton(
                        icon: Icons.search,
                      ),
                    ],
                  ),
                ),
                FoodSlider(),
              ],
            ),
          );
        }else{
          return Scaffold(
            body: Center(child: BigText(text: 'NOt connected',),),
          );

        }},
      ),
    );
  }
}
