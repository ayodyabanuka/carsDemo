class User {
  String? displayName;
  String? email;
  String? photoURL;

  //constructor
  User({this.displayName, this.email, this.photoURL});

  // we need to create map
  User.fromJson(Map<String, dynamic> json) {
    displayName = json["displayName"];
    photoURL = json["photoUrl"];
    email = json["email"];
  }
  Map<String, dynamic> toJson() {
    // object - data
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['photoUrl]'] = this.photoURL;

    return data;
  }
}
