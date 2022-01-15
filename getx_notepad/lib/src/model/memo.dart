import 'package:getx_notepad/src/dto/create_memo_reqeust.dart';
import 'package:nanoid/nanoid.dart' as nonoid;

class Memo{
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime lastModifiedAt;

  const Memo({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.lastModifiedAt
  });

  factory Memo.createRequest(CreateMemoRequest req){
    return Memo(
        id: nonoid.nanoid(),
        title: req.title,
        content: req.content,
        createdAt: DateTime.now(),
        lastModifiedAt: DateTime.now(),
    );
  }
}