import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFollowed = false;

  void follow(){
    setState(() {
      isFollowed = true;
    });
  }

  void unFollow(){
    setState(() {
      isFollowed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Store>().name),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.grey,
            ),
            Text('팔로워 ${context.watch<Store>().follower}명'),
            isFollowed ? renderingUnFollowButton(context) : renderingFollowButton(context),
          ],
        ),
      ),
    );
  }

  ElevatedButton renderingFollowButton(BuildContext context){
    return ElevatedButton(
      child: const Text('팔로우'),
      onPressed: () {
        context.read<Store>().upFollower();
        follow();
      },
    );
  }

  ElevatedButton renderingUnFollowButton(BuildContext context){
    return ElevatedButton(
      child: const Text('팔로우 취소'),
      onPressed: () {
        context.read<Store>().downFollower();
        unFollow();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange
      ),
    );
  }
}
