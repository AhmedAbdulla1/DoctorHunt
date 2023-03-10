import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool active= false;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: Column(
        children: [
          Center(
            child: Radio(
              activeColor: ColorManager.primary,
              onChanged: (value){

                setState(() {
                  if(active==false){
                    active =true;
                  }else{
                    active =false;
                  }
                  print(active);
                });

              },
              value: true,
              groupValue:active ,
            ),
          ),
          Center(
            child: Radio(
              activeColor: ColorManager.primary,
              onChanged: (value){

                setState(() {
                  if(active==false){
                    active =true;
                  }else{
                    active =false;
                  }
                  print(active);
                });

              },
              value: false,
              groupValue:active ,
            ),
          ),
        ],
      ),
    );
  }
}
