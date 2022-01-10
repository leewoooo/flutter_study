import 'dart:io';

class SaveArticleRequest{
  final int id;
  final File file;
  final String date;
  final String content;
  final String user;

  SaveArticleRequest({
    required this.id,
    required this.file,
    required this.date,
    required this.content,
    required this.user
  });
}