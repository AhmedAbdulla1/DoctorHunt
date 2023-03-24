import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/app/extensions.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:doctor_hunt/domain/models/models.dart';

extension UserDataResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(
      id: this?.id.orZero() ?? 0,
      email: this?.email.orEmpty() ?? Constant.empty,
      username: this?.username.orEmpty() ?? Constant.empty,
      phoneNumber: this?.phoneNumber.orEmpty() ?? Constant.empty,
      image: this?.image.orEmpty() ?? Constant.image,
      location: this?.location.orEmpty() ?? Constant.empty,
      dateBirth: this?.dateBirth.orEmpty() ?? Constant.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        userData: this?.userData.toDomain(),
        token: this?.token.orEmpty() ?? Constant.empty);
  }
}

extension LoginAuthenticationMapper on LoginAuthenticationResponse? {
  LoginAuthentication toDomain() {
    return LoginAuthentication(
      id: this?.id.orZero() ?? Constant.zero,
      token: this?.token.orEmpty() ?? Constant.empty,
    );
  }
}

extension SendEmailResponsMapper on SendEmailResponse? {
  SendEmail toDomain() {
    return SendEmail(
      detail: this?.otp.orEmpty() ?? Constant.empty,
    );
  }
}


extension FeatureDoctorResponseMapper on FeatureDoctorsResponse? {
  FeatureDoctors toDomain() {
    return FeatureDoctors(
      id: this?.id.orZero()??Constant.zero,
      username: this?.username.orEmpty() ?? Constant.empty,
      image: this?.image.orEmpty() ?? Constant.image,
      avgRating: this?.avgRating.orEmpty()??Constant.zero.toString(),
      isLive: this?.isLive??false,
      price: this?.price.orZero()??Constant.zero,
      views: this?.views.orZero()??Constant.zero,
      specialist: this?.specialist.orEmpty()??Constant.empty,

    );
  }
}

extension PopularDoctorsResponseMapper on PopularDoctorsResponse? {
  PopularDoctors toDomain() {
    return PopularDoctors(
      id: this?.id.orZero()??Constant.zero,
      username: this?.username.orEmpty() ?? Constant.empty,
      image: this?.image.orEmpty() ?? Constant.image,
      avgRating: this?.avgRating.orEmpty()??Constant.zero.toString(),
      isLive: this?.isLive??false,
      price: this?.price.orZero()??Constant.zero,
      views: this?.views.orZero()??Constant.zero,
      specialist: this?.specialist.orEmpty()??Constant.empty,
    );
  }
}

extension LiveDoctorResponsMapper on LiveDoctorResponse? {
  LiveDoctors toDomain() {
    return LiveDoctors(
      id: this?.id.orZero()??Constant.zero,
      username: this?.username.orEmpty() ?? Constant.empty,
      image: this?.image.orEmpty() ?? Constant.image,
      avgRating: this?.avgRating.orEmpty()??Constant.zero.toString(),
      isLive: this?.isLive??false,
      price: this?.price.orZero()??Constant.zero,
      views: this?.views.orZero()??Constant.zero,
      specialist: this?.specialist.orEmpty()??Constant.empty,
    );
  }
}
//
extension HomeResponseMapper on HomeResponse? {
  Home toDomain() {
    UserData? userData =this?.data?.userData.toDomain() ;
    List<LiveDoctors> liveDoctors = (this
                ?.data
                ?.liveDoctors
                ?.map((liveDoctorsResponse) => liveDoctorsResponse.toDomain()) ??
            const Iterable.empty())
        .cast<LiveDoctors>()
        .toList();
    List<PopularDoctors> popularDoctors = (this
                ?.data
                ?.popularDoctors
                ?.map((popularDcotorsResponse) => popularDcotorsResponse.toDomain()) ??
            const Iterable.empty())
        .cast<PopularDoctors>()
        .toList();
    List<FeatureDoctors> featureDoctors = (this
                ?.data
                ?.featureDoctors
                ?.map((featureDoctorsResponse) => featureDoctorsResponse.toDomain()) ??
            const Iterable.empty())
        .cast<FeatureDoctors>()
        .toList();

    return Home(userData: userData, liveDoctors: liveDoctors, popularDoctors: popularDoctors,featureDoctors: featureDoctors,);
  }
}

// extension StoresDetailsResponseMapper on StoresDetailsResponse? {
//   StoresDetails toDomain() {
//     return StoresDetails(
//         id: this?.id.orZero() ?? Constant.zero,
//         image: this?.image.orEmpty() ?? Constant.image,
//         title: this?.title.orEmpty() ?? Constant.empty,
//         details: this?.details.orEmpty() ?? Constant.empty,
//         service: this?.services.orEmpty() ?? Constant.empty,
//         about: this?.about.orEmpty() ?? Constant.empty);
//   }
// }
