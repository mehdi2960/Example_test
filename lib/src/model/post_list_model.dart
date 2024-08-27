class PostListModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostListModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostListModel.fromJson( Map<String, dynamic> json) {
    return PostListModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
