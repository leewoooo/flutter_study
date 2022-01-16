class UpdateMemoReqeust{
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime lastModifiedAt;

  UpdateMemoReqeust({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.lastModifiedAt
  });
}