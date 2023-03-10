import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 155),
          child: Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.none, children: [
            Container(
              height: 155,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Handwerker!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeightManager.light,
                          color: ColorManager.white,
                        ),
                      ),
                      Text(
                        'Find Your Doctor',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 30,
                    foregroundImage: AssetImage(ImageAssets.personal),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 22,
              right: 22,
              bottom: -28,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                // width: 335,
                height: 54,
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      suffixIcon: Icon(Icons.close),
                      prefixIcon: Icon(Icons.search_sharp),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search....',
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ]),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageAssets.backGround,
              ),
              fit: BoxFit.fill,
            ),
          ),
          // child: Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     Container(
          //       width: 200,
          //       height: 200,
          //       color: Colors.blue,
          //     ),
          //     Positioned(
          //
          //       bottom: -50,
          //       left: 50,
          //       child: Container(
          //         width: 100,
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //     ),
          //   ],
          // )
        ));
  }
}
