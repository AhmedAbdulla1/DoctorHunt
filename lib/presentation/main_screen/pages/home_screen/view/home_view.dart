import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/home_screen/view_model/home_view_model.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
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
      builder: (context, snapshot) =>
          snapshot.data?.getScreenWidget(
            context,
            _getContent(),
            () {
              _homeViewModel.start();
            },
          ) ??
          _getContent(),
    );
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: StreamBuilder<HomeViewObject>(
          stream: _homeViewModel.outputHomeData,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAppBar(snapshot.data!.userData),
                const SizedBox(
                  height: 42,
                ),
                _getSection(AppStrings.liveDoctors),
                // _getLiveDoctors(),
                _getSection(AppStrings.popularDoctor),
                // _getStoresWidgets(),
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
                CircleAvatar(
                  radius: 30,
                  foregroundImage:
                      AssetImage(userData.image),
                ),
              ],
            ),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: -28,
            child: Center(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: ColorManager.white,
                ),
                child: ListTile(
                  trailing: const Icon(Icons.close),
                  title: const Text('Search....'),
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
//
// Widget _getLiveDoctors() {
//   // if (service != null) {
//   //   return SizedBox(
//   //     height: AppSize.s140,
//   //     child: ListView(
//   //       scrollDirection: Axis.horizontal,
//   //       children: service
//   //           .map((service) => SizedBox(
//   //         height: AppSize.s140,
//   //         child: Card(
//   //           elevation: AppSize.s1_5,
//   //           shape: RoundedRectangleBorder(
//   //             borderRadius: BorderRadius.circular(AppSize.s12),
//   //             side: BorderSide(
//   //                 color: ColorManager.primary, width: AppSize.s1),
//   //           ),
//   //           child: Column(
//   //             children: [
//   //               ClipRRect(
//   //                 borderRadius: BorderRadius.circular(
//   //                   AppSize.s12,
//   //                 ),
//   //                 child: Image.network(
//   //                   service.image,
//   //                   fit: BoxFit.cover,
//   //                   width: AppSize.s100,
//   //                   height: AppSize.s100,
//   //                 ),
//   //               ),
//   //               Padding(
//   //                 padding: const EdgeInsets.all(8.0),
//   //                 child: Text(
//   //                   service.title,
//   //                   style: Theme.of(context).textTheme.labelSmall,
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       ))
//   //           .toList(),
//   //     ),
//   //   );
//   // } else {
//
//     return ListView.builder(itemBuilder:(context, index) =>Stack(children: [
//       Image.asset(ImageAssets.live)
//
//     ],) );
//   // }
// }
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
