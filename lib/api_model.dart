class UserModel {
  String email;
  String phone;
  String gender;
  String nat;
  UserNameModel name;
  UserDobModel dob;
  LocationModel location;
  LoginModel login;
  UserPictureModel picture;

  UserModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.dob,
    required this.location,
    required this.login,
    required this.picture,
    required this.gender,
    required this.nat,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    final name = UserNameModel.fromMap(json['name']);
    final dob = UserDobModel.fromMap(json['dob']);
    final location = LocationModel.fromMap(json['location']);
    final login = LoginModel.fromMap(json['login']);
    final picture = UserPictureModel.fromMap(json['picture']);
    return UserModel(
        picture: picture,
        login: login,
        name: name,
        dob: dob,
        nat: json['nat'],
        location: location,
        email: json['email'],
        gender: json['gender'],
        phone: json['phone']);
  }

  String get fullname {
    return "${name.title} ${name.first} ${name.last}";
  }
}

class UserNameModel {
  String title;
  String first;
  String last;

  UserNameModel({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserNameModel.fromMap(Map<String, dynamic> json) {
    return UserNameModel(
        title: json['title'], first: json['first'], last: json['last']);
  }
}

class UserDobModel {
  DateTime date;
  int age;

  UserDobModel({required this.date, required this.age});

  factory UserDobModel.fromMap(Map<String, dynamic> json) {
    final date = json['date'];
    return UserDobModel(date: DateTime.parse(date), age: json['age']);
  }
}

class LocationModel {
  String city;
  String state;
  String country;
  // num postcode;

  LocationModel({
    required this.city,
    required this.state,
    required this.country,
    // required this.postcode,
  });

  factory LocationModel.fromMap(Map<String, dynamic> json) {
    return LocationModel(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      // postcode: json['postcode'],
    );
  }
}

class LoginModel {
  String username;
  String password;

  LoginModel({
    required this.username,
    required this.password,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) {
    return LoginModel(username: json['username'], password: json['password']);
  }
}

class UserPictureModel {
  String large;
  String medium;
  String thumbnail;

  UserPictureModel({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPictureModel.fromMap(Map<String, dynamic> json) {
    return UserPictureModel(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail']);
  }
}
