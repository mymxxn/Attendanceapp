class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? phonenum;
  UserModel({this.uid, this.email, this.firstname, this.phonenum});
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstname: map['firstName'],
        phonenum: map['phonenum']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstname,
      'phone': phonenum
    };
  }
}
