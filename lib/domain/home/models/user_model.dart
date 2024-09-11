class UserModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String img;
  String cover;
  int articlesCount;
  int followers;
  int following;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.img,
    required this.cover,
    required this.articlesCount,
    required this.followers,
    required this.following
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        img: json['img'],
        cover: json['cover'],
        articlesCount: json['articlesCount'],
        followers: json['followers'],
        following: json['following']
    );
  }

}