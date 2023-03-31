import 'package:doctor_hunt/app/di.dart';
import 'package:doctor_hunt/app/extensions.dart';
import 'package:doctor_hunt/domain/models/models.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_render.dart';
import 'package:doctor_hunt/presentation/common/state_render/state_renderer_imp.dart';
import 'package:doctor_hunt/presentation/main_screen/pages/home_screen/view_model/home_view_model.dart';
import 'package:doctor_hunt/presentation/resources/assets_manager.dart';
import 'package:doctor_hunt/presentation/resources/color_manager.dart';
import 'package:doctor_hunt/presentation/resources/font_manager.dart';
import 'package:doctor_hunt/presentation/resources/routes_manager.dart';
import 'package:doctor_hunt/presentation/resources/string_manager.dart';
import 'package:doctor_hunt/presentation/resources/style_manager.dart';
import 'package:doctor_hunt/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContent(),
                () {},
              ) ??
              _getContent();
        });
  }

  Widget _getContent() {
    return SingleChildScrollView(
      child: StreamBuilder<HomeViewObject>(
          stream: _homeViewModel.outputHomeData,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAppBar(snapshot.data?.userData),
                const SizedBox(
                  height: 35,
                ),
                _getSection(AppStrings.liveDoctors),
                _getLiveDoctors(snapshot.data?.liveDoctors),
                const SizedBox(
                  height: AppPadding.p10,
                ),
                _getSpecialist(),
                _getSection(AppStrings.popularDoctor),
                _getPopularDoctors(snapshot.data?.popularDoctor),
                _getSection(AppStrings.featureDoctor),
                _getFeatureDoctors(snapshot.data?.featureDoctor),
                const SizedBox(
                  height: AppPadding.p10,
                ),
              ],
            );
          }),
    );
  }

  Widget _getAppBar(UserData? userData) {
    if (userData != null) {
      return Stack(
        fit: StackFit.passthrough,
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
                      'Hi ${userData.username.toCapitalizedCase()}',
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
                  foregroundImage: userData.image == ImageAssets.personal
                      ? AssetImage(
                          userData.image,
                        )
                      : NetworkImage(
                          userData.image,
                        ) as ImageProvider,
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
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.lightGrey.withOpacity(0.5),
                      //color of shadow
                      spreadRadius: 5,
                      //spread radius
                      blurRadius: 7,
                      // blur radius
                      offset: const Offset(1, 2),
                    ),
                  ],
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
      );
    } else {
      return Container(
        height: 140,
        color: ColorManager.primary,
      );
    }
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          title == AppStrings.liveDoctors
              ? const SizedBox()
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.seeAll,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _getLiveDoctors(List<LiveDoctors>? liveDoctor) {
    if (liveDoctor != null) {
      return SizedBox(
        height: 180,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p10,
            left: AppPadding.p16,
            right: AppPadding.p16,
            top: AppPadding.p5,
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: AppSize.s16,
          ),
          itemCount: liveDoctor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s6),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.lightGrey.withOpacity(0.5),
                  //color of shadow
                  spreadRadius: 3,
                  //spread radius
                  blurRadius: 4,
                  // blur radius
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                liveDoctor[index].image == ImageAssets.personal
                    ? Image.asset(
                        liveDoctor[index].image,
                      )
                    : Image.network(
                        liveDoctor[index].image,
                        width: 115,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
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
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: AppSize.s1_5),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(AppSize.s5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s1_5,
                          ),
                          Text(
                            "live",
                            style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
    // }
  }

  final List<String> _specialist = [
    ImageAssets.toothDentist,
    ImageAssets.heartDentist,
    ImageAssets.eayDentist,
    ImageAssets.slimmingDentist,
  ];

  Widget _getSpecialist() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: AppPadding.p10,
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: AppPadding.p5,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: AppPadding.p12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          width: 80,
          height: 90,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              AppSize.s6,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey.withOpacity(0.5),
                //color of shadow
                spreadRadius: 3,
                //spread radius
                blurRadius: 4,
                // blur radius
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Image.asset(
            _specialist[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getPopularDoctors(List<PopularDoctors>? popularDoctors) {
    if (popularDoctors != null) {
      return SizedBox(
        height: 280,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p10,
            left: AppPadding.p16,
            right: AppPadding.p16,
            top: AppPadding.p5,
          ),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            width: AppSize.s16,
          ),
          itemCount: popularDoctors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 190,
              height: 265,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.lightGrey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(2, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  AppSize.s12,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  popularDoctors[index].image == ImageAssets.personal
                      ? Image.asset(
                          popularDoctors[index].image,
                        )
                      : Image.network(
                          popularDoctors[index].image,
                          fit: BoxFit.cover,
                          height: 180,
                          width: 190,
                        ),
                  Text(
                    "Dr.${popularDoctors[index].username.toCapitalizedCase()}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    popularDoctors[index].specialist.toCapitalizedCase(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  RatingBarIndicator(
                    rating:
                        double.tryParse(popularDoctors[index].avgRating) ?? 0.0,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: ColorManager.starActive,
                    ),
                    itemCount: 5,
                    itemSize: AppSize.s14,
                    direction: Axis.horizontal,
                    unratedColor: ColorManager.starNoActive,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
    // }
  }

  Widget _getFeatureDoctors(List<FeatureDoctors>? featureDoctors) {
    if (featureDoctors != null) {
      return SizedBox(
        height: 140,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p10,
            left: AppPadding.p16,
            right: AppPadding.p16,
            top: AppPadding.p5,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: featureDoctors.length,
          separatorBuilder: (context, _) => const SizedBox(
            width: AppSize.s12,
          ),
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            width: AppSize.s100,
            height: AppSize.s130,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s6),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.lightGrey.withOpacity(0.5),
                  //color of shadow
                  spreadRadius: 3,
                  //spread radius
                  blurRadius: 4,
                  // blur radius
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    featureDoctors[index].isLiked
                        ? Icon(
                            Icons.favorite,
                            color: ColorManager.error,
                            size: AppSize.s14,
                          )
                        : const Icon(
                            Icons.favorite_border_rounded,
                            size: AppSize.s14,
                          ),
                    const Expanded(child: SizedBox()),
                    Icon(
                      Icons.star_rounded,
                      size: AppSize.s14,
                      color: ColorManager.starActive,
                    ),
                    Text(
                      featureDoctors[index].avgRating.substring(0, 3),
                      style: const TextStyle(
                        fontSize: FontSize.s10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: AppSize.s28,
                  foregroundImage:
                      featureDoctors[index].image == ImageAssets.personal
                          ? const AssetImage(
                              ImageAssets.personal,
                            )
                          : NetworkImage(featureDoctors[index].image)
                              as ImageProvider,
                ),
                Text(
                  "Dr.${featureDoctors[index].username.firstName().toCapitalizedCase()}",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  '\$ ${featureDoctors[index].price}/hours',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
