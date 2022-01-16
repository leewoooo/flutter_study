import 'package:get/get.dart';
import 'package:getx_notepad/src/model/memo.dart';

const first = 0;

class MemoController extends GetxController{
  final List<Memo> _memos = [];
  int _currentDetail = 0;

  // getter
  List<Memo> get memos => _memos;
  int get currentDetail => _currentDetail;

  addMemo(Memo memo){
    _memos.insert(first, memo);
    update();
  }

  remove(int currentDetail){
    _memos.removeAt(currentDetail);
    update();
  }

  setCurrentDetail(int index){
    _currentDetail = index;
    update();
  }

  updateMemo(int index,Memo memo){
    memos[index] = memo;
    update();
  }
}