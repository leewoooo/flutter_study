import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> contactList = List.from(["이우길","이우길2","이우길3"]);

  getPermission() async {
    // Permission.contacts.status 비동기 작업을 기다리기 위한 await
    // js는 promise를 return하는 곳에서만 사용하는 것 같이
    // dart에선느 Future를 return하는 곳에 사용 가능
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');

      List<Contact> contacts = await ContactsService.getContacts();
      for (Contact contact in contacts){
        print(contact.displayName);
      }

      Contact newPerson = Contact(
        givenName: '이우길',
      );

      // await ContactsService.addContact(newPerson);

    } else if (status.isDenied) {
      print('거절됨');
      // 허락해달라고 요청
      Permission.contacts.request();
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: () {

        },
      ),
      appBar: AppBar(
        title: Text('연락처 연동'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.contacts),
            onPressed: () {
              getPermission();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(contactList[index]),
          );
        },
      ),
    );
  }
}

