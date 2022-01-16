import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/src/controller/memo_controller.dart';
import 'package:getx_notepad/src/dto/update_memo_request.dart';
import 'package:getx_notepad/src/model/memo.dart';
import 'package:getx_notepad/src/ui/home.dart';
import 'package:getx_notepad/src/widget/custom_form_field.dart';

class MemoUpdate extends StatelessWidget {
  MemoUpdate({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Memo memo = Get.arguments as Memo;

  late final String title;
  late final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
        actions: [
          TextButton(
            child: const Text(
              '수정',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              if(formKey.currentState!.validate()){
                // save
                formKey.currentState!.save();
                // update
                Get.find<MemoController>().updateMemo(
                    Get.find<MemoController>().currentDetail,
                    Memo.fromUpdateRequest(UpdateMemoReqeust(
                      id: memo.id,
                      title: title,
                      content: content,
                      createdAt: memo.createdAt,
                      lastModifiedAt: DateTime.now()
                    )
                  )
                );
                // navigator
                Get.offAll(() => const Home());
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              rederTextFormField(
                initialValue: memo.title,
                label: '제목',
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return '제목을 입력해주세요';
                  }
                  return null;
                },
                onSaved: (title) {
                  this.title = title.toString();
                },
              ),
              rederTextFormField(
                initialValue: memo.content,
                label: '본문',
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return '본문을 입력해주세요';
                  }
                  return null;
                },
                onSaved: (content) {
                  this.content = content.toString();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
