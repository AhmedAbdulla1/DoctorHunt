import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/home_screen/view_model/home_view_model.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
     _homeViewModel.start();
  }

  @override
  void initState() {
    debugPrint('start');
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StateFlow>(
      stream: _homeViewModel.outputState,
      builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
            context,
            _getContent(),
            () {
              _homeViewModel.start();
            },
          ) ??
          _getContent();}
    );
  }
  final UserData _userData=UserData(id: 10, email: 'email', username: 'username', phoneNumber: 'phoneNumber', image: ImageAssets.personal, location: 'location', dateBirth: 'dateBirth');
  Widget _getContent() {
    return SingleChildScrollView(
      child: StreamBuilder<HomeViewObject>(
          stream: _homeViewModel.outputHomeData,
          builder: (context, snapshot) {

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAppBar(_userData),
                const SizedBox(
                  height: 42,
                ),
                _getSection(AppStrings.liveDoctors),
                _getLiveDoctors(),
                _getSection(AppStrings.popularDoctor),
                // _getStoresWidgets(),
                _getSection(AppStrings.featureDoctor),

              ],
            );
          }),
    );
  }

  Widget _getAppBar(UserData userData) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 155),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
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
                      'Hi ${userData.username}',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      AppStrings.findYourDoctor,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: AppSize.s30,
                  foregroundImage: AssetImage(
                    userData.image,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: AppPadding.p22,
            right: AppPadding.p22,
            bottom: -AppPadding.p28,
            child: Center(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s6),
                  color: ColorManager.white,
                ),
                child: ListTile(
                  trailing: const Icon(Icons.close),
                  title: const Text(AppStrings.search),
                  leading: const Icon(Icons.search_sharp),
                  minLeadingWidth: 0,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.settingScreen);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSection(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            AppStrings.seeAll,
          ),
        ),
      ],
    );
  }

  Widget _getLiveDoctors() {
    // if (service != null) {
    //   return SizedBox(
    //     height: AppSize.s140,
    //     child: ListView(
    //       scrollDirection: Axis.horizontal,
    //       children: service
    //           .map((service) => SizedBox(
    //         height: AppSize.s140,
    //         child: Card(
    //           elevation: AppSize.s1_5,
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s12),
    //             side: BorderSide(
    //                 color: ColorManager.primary, width: AppSize.s1),
    //           ),
    //           child: Column(
    //             children: [
    //               ClipRRect(
    //                 borderRadius: BorderRadius.circular(
    //                   AppSize.s12,
    //                 ),
    //                 child: Image.network(
    //                   service.image,
    //                   fit: BoxFit.cover,
    //                   width: AppSize.s100,
    //                   height: AppSize.s100,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   service.title,
    //                   style: Theme.of(context).textTheme.labelSmall,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ))
    //           .toList(),
    //     ),
    //   );
    // } else {

    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            width: 115,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s6)
            ),
            child: Stack(
                  children: [
                    Positioned(
                      top: AppSize.s10,
                      right: AppSize.s10,
                      child: Container(
                        width: AppSize.s40,
                        height: AppSize.s18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s4),
                          color: ColorManager.error,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                             radius: AppSize.s5,
                              foregroundColor: ColorManager.white,
                            ),
                            const Text("live"),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      ImageAssets.live,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
          )),
    );
    // }
  }
//
// Widget _getStoresWidgets() {
//   // if (stores != null) {
//   //   return Flex(
//   //     direction: Axis.vertical,
//   //     children: [
//   //       GridView.count(
//   //         crossAxisCount: 2,
//   //         crossAxisSpacing: AppSize.s8,
//   //         physics: const ScrollPhysics(),
//   //         shrinkWrap: true,
//   //         children:stores
//   //             .map(
//   //               (stores) => InkWell(
//   //             onTap: (){
//   //               Navigator.of(context).pushNamed(Routes.storeDetailsScreen);
//   //             },
//   //             child: Card(
//   //               elevation: AppSize.s4,
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(AppSize.s12),
//   //                 side: BorderSide(
//   //                     color: ColorManager.primary, width: AppSize.s1),
//   //               ),
//   //               child: ClipRRect(
//   //                 borderRadius: BorderRadius.circular(
//   //                   AppSize.s12,
//   //                 ),
//   //                 child: Image.network(
//   //                   stores.image,
//   //                   fit: BoxFit.cover,
//   //
//   //                 ),
//   //               ),
//   //             ),
//   //           ),
//   //         )
//   //             .toList(),
//   //       ),
//   //     ],
//   //   );
//   // } else {
//     return Container();
//   // }
// }
}
