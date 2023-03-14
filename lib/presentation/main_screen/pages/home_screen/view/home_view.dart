import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:const  [
        Center(
          child: Text(''
              'Home',style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }
}
