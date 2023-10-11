class FirstApiModel {
  int userId;
  int id;
  String title;
  String body;

  FirstApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory FirstApiModel.fromJson(Map<String, dynamic> json) => FirstApiModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
