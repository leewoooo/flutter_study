import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/src/controller/memo_controller.dart';
import 'package:getx_notepad/src/dto/create_memo_reqeust.dart';
import 'package:getx_notepad/src/model/memo.dart';
import 'package:getx_notepad/src/widget/custom_form_field.dart';

class Register extends StatelessWidget {
  Register({Key? key, required}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 메모'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // validate
              if (formKey.currentState!.validate()) {
                // save where state
                formKey.currentState!.save();
                // add New Memo
                Memo newMemo = Memo.createRequest(CreateMemoRequest(
                    title: title,
                    content:content
                  )
                );
                Get.find<MemoController>().addMemo(newMemo);
                // navigator back
                Get.back();
                return;
              }
              return;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              rederTextFormField(
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
