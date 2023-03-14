import 'package:doctor_hunt/presentation/main_screen/pages/book_screen/view/book_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/chat_screen/view/chat_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/favorite/view/favorite_view.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/home_screen/view/home_view.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int  _currentIndex = 0;
    List<Widget> screens = <Widget>[
   // Text('home'),
   // Text('notification'),
   // Text('book'),
   // Text('chat')
     const home(),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 155),
        child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 155,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(97, 206, 255, 0.45),
                    Colors.white
                  ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
                ),
              ),
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
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(Icons.close),
                      prefixIcon: const Icon(Icons.search_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: InputBorder.none,
                      hintText: 'Search....',
                    ),
                    onTap: () {},
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
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 78,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(14, 190, 73, 0.3),
                Colors.white,
              ],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            )),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 50,
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
        ],
      ),
    );
  }
}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('home'));
  }
}

// import 'package:flutter/material.dart';
//
// class MainView extends StatefulWidget {
//   @override
//   _MainViewState createState() => _MainViewState();
// }
//
// class _MainViewState extends State<MainView> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home'),
//     Text('Search'),
//     Text('Profile'),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Bottom Navigation Bar Example'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
