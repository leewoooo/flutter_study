class UpdateMemoReqeust{
  final String title;
  final String content;
  final DateTime lastModifiedAt;

  UpdateMemoReqeust({
    required this.title,
    required this.content,
    required this.lastModifiedAt
  });
}