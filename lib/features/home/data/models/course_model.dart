class CourseModel {
  final String id;
  final String image;
  final String title;
  final double price;
  final String desc;
  CourseModel({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.desc,
  });
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      image: json['image'],
      price: json['price'],
      title: json['title'],
      desc: json['desc'],
    );
  }
}
