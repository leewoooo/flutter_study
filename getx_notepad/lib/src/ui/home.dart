import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/src/controller/memo_controller.dart';
import 'package:getx_notepad/src/model/memo.dart';
import 'package:getx_notepad/src/ui/memo_detail.dart';
import 'package:getx_notepad/src/ui/memo_register.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _makeMemoList(Memo memo) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            memo.title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Text(
              memo.content,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
              '마지막 수정일 : ${DateFormat('yyyy-MM-dd HH:mm:ss a').format(memo.lastModifiedAt).toString()}')
        ],
      ),
    );
  }

  Widget _renderFloatingActionButton() {
    return FloatingActionButton.extended(
      label: const Text(
        '메모 추가',
        style: TextStyle(color: Colors.black),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      onPressed: () {
        Get.to(() => Register());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MemoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotePad'),
      ),
      body: GetBuilder<MemoController>(
        builder: (controller) {
          return ListView.separated(
            itemCount: controller.memos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.setCurrentDetail(index);
                  Get.to(() => MemoDetail(),
                      arguments: controller.memos[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3.0,
                              blurRadius: 3.0,
                              offset: Offset.zero)
                        ]),
                    child: _makeMemoList(controller.memos[index]),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
      floatingActionButton: _renderFloatingActionButton(),
    );
  }
}
