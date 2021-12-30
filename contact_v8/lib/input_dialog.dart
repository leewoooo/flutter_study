import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class UserInputDialog extends StatelessWidget {
  UserInputDialog({Key? key, required this.refreshContacts}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Function refreshContacts;
  String name = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('등록하기'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            renderTextFormFiled(
              label: '이름',
              validator: (value) {
                if (value.toString().isEmpty){
                  return '이름을 입력해주세요.';
                }
                return null;
              },
              onSaved: (newValue) {
                name = newValue;
              },
            ),
            renderTextFormFiled(
              label: '핸드폰 번호',
              validator: (value) {
                if (value.toString().isEmpty){
                  return '핸드폰 번호를 입력해주세요';
                }
                return null;
              },
              onSaved: (newValue) {
                phoneNumber = newValue;
              },
            )
          ],
        ),
      ),
      actions: [
        renderSubmitButton(context),
        renderCancelButton(context),
      ],
    );
  }

  //https://www.youtube.com/watch?v=V4xk4pmzY2I&t=7s
  renderTextFormFiled({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator
  }){
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        TextFormField(
          validator: validator,
          onSaved: onSaved,
        ),
        // input 끼리의 공간을 띄우기 위해
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }

  renderSubmitButton(context){
    return ElevatedButton(
        onPressed: () async {
          //formkey를 이용하여 validate and save 관리
          if (formKey.currentState!.validate()){
            formKey.currentState!.save();

            //TODO: 등록
            Contact newContact = Contact(
                givenName: name,
                phones: [
                  Item(
                    label: 'phone',
                    value: phoneNumber,
                  )]
            );
            await ContactsService.addContact(newContact);
            refreshContacts();
            Navigator.pop(context);
          }
        },
        child: const Text('등록')
    );
  }

  renderCancelButton(context){
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('취소'),
    );
  }
}
