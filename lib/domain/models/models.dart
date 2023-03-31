class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

class DoctorData {
  int id;
  String username;
  String email;
  String phoneNumber;
  String image;
  String location;

  DoctorData({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.image,
    required this.location,
  });
}

class UserData {
  int id;

  String username;
  String email;
  String phoneNumber;
  String image;
  String location;
  String dateBirth;

  UserData({
    required this.id,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.image,
    required this.location,
    required this.dateBirth,
  });
}

class Authentication {
  UserData? userData;
  String token;

  Authentication({
    required this.userData,
    required this.token,
  });
}

class LoginAuthentication {
  int id;
  String token;

  LoginAuthentication({
    required this.id,
    required this.token,
  });
}

class SendEmail {
  String detail;

  SendEmail({required this.detail});
}

// home model
class Home {
  UserData? userData;
  List<LiveDoctors>? liveDoctors;
  List<PopularDoctors>? popularDoctors;
  List<FeatureDoctors>? featureDoctors;

  Home({
    required this.userData,
    required this.liveDoctors,
    required this.popularDoctors,
    required this.featureDoctors,
  });
}

class LiveDoctors {
  int id ;
  String username;
  String image;
  bool isLive;
  int views;
  String avgRating;
  int price;
  String specialist;

  LiveDoctors({
    required this.id,
    required this.username,
    required this.image,
    required this.isLive,
    required this.views,
    required this.avgRating,
    required this.price,
    required this.specialist,
  });
}

class PopularDoctors {
  int id ;
  String username;
  String image;
  bool isLive;
  int views;
  String avgRating;
  int price;
  String specialist;

  PopularDoctors({
    required this.id,
    required this.username,
    required this.image,
    required this.isLive,
    required this.views,
    required this.avgRating,
    required this.price,
    required this.specialist,
  });
}

class FeatureDoctors {
  int id ;
  String username;
  String image;
  bool isLiked;
  bool isLive;
  int views;
  String avgRating;
  int price;
  String specialist;

  FeatureDoctors({
    required this.id,
    required this.username,
    required this.image,
    required this.isLiked,
    required this.isLive,
    required this.views,
    required this.avgRating,
    required this.price,
    required this.specialist,
  });
}
