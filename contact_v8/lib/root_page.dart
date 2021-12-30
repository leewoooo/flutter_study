import 'package:contact_v8/input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<RootPage> {
  List<Contact> contacts = [];

  // get permisson
  getPermission() async{
    PermissionStatus contactsStatus = await Permission.contacts.status;
    if (contactsStatus.isDenied){
      print('거절됨');
      // android 11 or IOS 는 2번이상 거절하면 reqeust 보낼 수 없음.
      PermissionStatus resultStatus =  await Permission.contacts.request();
      if (resultStatus.isGranted){
        getContacts();
      }else{
        // 그렇기 때문에 openAppSetting으로 User가 직접 처리
        openAppSettings();
      }
    }

    if (contactsStatus.isGranted){
      getContacts();
    }
  }

  getContacts() async {
    List<Contact> selectedContacts = await ContactsService.getContacts();
    setState(() {
      contacts = selectedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text('등록'),
        onPressed: () {
         showDialog(context: context, builder: (context) {
           return UserInputDialog(refreshContacts : getContacts);
         });
        }
      ),
      appBar: AppBar(
        title: const Text('사용자 연락처'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.contacts),
            onPressed: () {
              getPermission();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text('${contacts[i].givenName} ${contacts[i].familyName}'),
          );
        },
      ),
    );
  }
}
