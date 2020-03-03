class Post{
  final String title;
  final String content;
  final String time;
  final String type;

  Post({this.title, this.content, this.time, this.type});

   factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['body'],
      time: "json['title']",
      type: "json['body']",
    );
  }
}