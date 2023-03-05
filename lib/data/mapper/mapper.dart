import 'package:doctor_hunt/app/constant.dart';
import 'package:doctor_hunt/app/extensions.dart';
import 'package:doctor_hunt/data/response/responses.dart';
import 'package:doctor_hunt/domain/models/models.dart';

extension UserDataResponseMapper on UserDataResponse? {
  UserData toDomain() {
    return UserData(
      id: this?.id.orZero() ?? 0,
      email: this?.email.orEmpty() ?? Constant.empty,
      username: this?.image.orEmpty() ?? Constant.empty,
      phoneNumber: this?.phoneNumber.orEmpty() ?? Constant.empty,
      image: this?.image.orEmpty() ?? Constant.empty,
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
      detail: this?.detail.orEmpty() ?? Constant.empty,
    );
  }
}

// // extension CustomerResponseMapper on CustomerResponse? {
// //   Customer toDomain() {
// //     return Customer(
// //       id: this?.id.orEmpty() ?? "",
// //       name: this?.name.orEmpty() ?? "",
// //       numOfNotifications: this?.numOfNotifications.orZero() ?? 0,
// //     );
// //   }
// }
//
// // extension ContactsResponseMapper on ContactsResponse? {
// //   Contact toDomain() {
// //     return Contact(
// //       phone: this?.phone.orEmpty() ?? Constant.empty,
// //       email: this?.email.orEmpty() ?? Constant.empty,
// //       link: this?.link.orEmpty() ?? Constant.empty,
// //     );
// //   }
// // }
//
// // extension AuthenticationResponseMapper on AuthenticationResponse? {
// //   Authentication toDomain() {
// //     return Authentication(
// //       customer: this?.customer.toDomain(),
// //       contact: this?.contacts.toDomain(),
// //     );
// //   }
// // }
//
// extension ServicesResponseMapper on ServicesResponse? {
//   Service toDomain() {
//     return Service(
//       id: this?.id.orZero() ?? Constant.zero,
//       title: this?.title.orEmpty() ?? Constant.empty,
//       image: this?.image.orEmpty() ?? Constant.image,
//     );
//   }
// }
//
// extension StoresResponseMapper on StoresResponse? {
//   Stores toDomain() {
//     return Stores(
//       id: this?.id.orZero() ?? Constant.zero,
//       title: this?.title.orEmpty() ?? Constant.empty,
//       image: this?.image.orEmpty() ?? Constant.image,
//     );
//   }
// }
//
// extension BannersResponseMapper on BannersResponse? {
//   Banners toDomain() {
//     return Banners(
//       id: this?.id.orZero() ?? Constant.zero,
//       link: this?.link.orEmpty() ?? Constant.empty,
//       title: this?.title.orEmpty() ?? Constant.empty,
//       image: this?.image.orEmpty() ?? Constant.image,
//     );
//   }
// }
//
// extension HomeResponseMapper on HomeResponse? {
//   Home toDomain() {
//     List<Service> services = (this
//                 ?.data
//                 ?.services
//                 ?.map((serviceResponse) => serviceResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<Service>()
//         .toList();
//     List<Stores> stores = (this
//                 ?.data
//                 ?.stores
//                 ?.map((storesResponse) => storesResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<Stores>()
//         .toList();
//     List<Banners> banners = (this
//                 ?.data
//                 ?.banners
//                 ?.map((bannerResponse) => bannerResponse.toDomain()) ??
//             const Iterable.empty())
//         .cast<Banners>()
//         .toList();
//     Data? data = Data(services: services, banners: banners, stores: stores);
//     return Home(data: data);
//   }
// }
//
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
