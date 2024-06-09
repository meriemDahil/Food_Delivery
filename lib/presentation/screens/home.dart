import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/presentation/cubit/internet_cubit.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<InternetCubit, InternetStatus>(
        builder: (context, state) {
          if (state.status == ConnectivityStatus.connected) {
            return Center(child: Text('Connected to the internet'));
          } else {
            return Center(child: Text('Disconnected from the internet'));
          }
        },
      ),
    );
  }
}
