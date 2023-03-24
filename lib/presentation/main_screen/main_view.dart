import 'package:doctor_hunt/presentation/main_screen/pages/book_screen/view/book_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/chat_screen/view/chat_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/favorite/view/favorite_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/home_screen/view/home_view.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> screens = <Widget>[
    const HomeView(),
    const FavoriteView(),
    const BookView(),
    const ChatView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageAssets.backGround,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,

        body: screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
          child: BottomNavigationBar(
            elevation: 30,
            onTap: _onItemTapped,
            currentIndex: _currentIndex,
            selectedItemColor: ColorManager.white,
            unselectedItemColor: ColorManager.iconGrey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _currentIndex == 0 ? ColorManager.primary : null,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.home),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _currentIndex == 1 ? ColorManager.primary : null,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.favorite,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'book',
                icon: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _currentIndex == 2 ? ColorManager.primary : null,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.book,
                    colorFilter: ColorFilter.mode(
                        _currentIndex == 2
                            ? ColorManager.white
                            : ColorManager.iconGrey,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: 'book',
                icon: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _currentIndex == 3 ? ColorManager.primary : null,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.chat,
                    colorFilter: ColorFilter.mode(
                        _currentIndex == 3
                            ? ColorManager.white
                            : ColorManager.iconGrey,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
