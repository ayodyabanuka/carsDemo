class car {
  String name;
  String imageURL;

  car({
    required this.name,
    required this.imageURL,
  });

  factory car.fromJson(Map<String, dynamic> json) {
    return car(
      name: json['name'],
      imageURL: json['img_url'],
    );
  }
}
