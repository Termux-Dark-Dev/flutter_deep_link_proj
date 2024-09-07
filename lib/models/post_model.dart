class PostModel<T> {
  final String userAlpha;
  final String userName;
  final T body;
  final int id;
  final String dataSrc;

  PostModel(
      {required this.userAlpha,
      required this.dataSrc,
      required this.userName,
      required this.body,
      required this.id});
}
