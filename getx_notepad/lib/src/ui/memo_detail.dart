import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/src/controller/memo_controller.dart';
import 'package:getx_notepad/src/model/memo.dart';
import 'package:getx_notepad/src/ui/home.dart';
import 'package:getx_notepad/src/ui/memo_update.dart';
import 'package:intl/intl.dart';

class MemoDetail extends StatelessWidget {
  MemoDetail({Key? key}) : super(key: key);
  final Memo memo = Get.arguments as Memo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          TextButton(
            child: const Text(
              'Update',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Get.to(() => MemoUpdate(), arguments: memo);
            },
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Get.defaultDialog(
                  title: 'Delete',
                  content: const Text('삭제하시겠습니까?'),
                  actions: [
                    ElevatedButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        // delete
                        Get.find<MemoController>()
                            .remove(Get.find<MemoController>().currentDetail);
                        // home으로
                        Get.offAll(() => const Home());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                      ),
                    ),
                  ]);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('마지막 수정일 : ${DateFormat('yyyy-MM-dd HH:mm:ss a').format(memo.lastModifiedAt).toString()}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10.0),
                Text(
                  memo.title,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 10.0,
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  )),
                ),
                Text(memo.content)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
