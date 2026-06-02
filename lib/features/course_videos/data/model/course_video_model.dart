class CourseVideoModel{
  final String id;
  final String title;
  final String? desc;
  final String? image;
  final String url;
  CourseVideoModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.url
});
  factory CourseVideoModel.fromSupabase(Map<String,dynamic>sup){
    return CourseVideoModel(
        id: sup['id'],
        title: sup['title'],
        desc: sup['desc'],
        image: sup['image'],
        url: sup['video_url']);
  }



}