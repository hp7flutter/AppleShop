class CommentModel {
  final String id;
  final String collectionId;
  final String productId;
  final String userId;
  final String userThumbnail;
  final String username;
  final String avatar;

  const CommentModel({
    required this.id,
    required this.collectionId,
    required this.productId,
    required this.userId,
    required this.userThumbnail,
    required this.username,
    required this.avatar,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    final String id = json['id'];
    final String collectionId = json['collectionId'];
    final String productId = json['productId'];
    final String userId = json['userId'];
    final String userThumbnail = json['userThumbnail'];
    final String username = json['username'];
    final String avatar = json['avatar'];
    return CommentModel(
      id: id,
      collectionId: collectionId,
      productId: productId,
      userId: userId,
      userThumbnail: userThumbnail,
      username: username,
      avatar: avatar,
    );
  }
}
