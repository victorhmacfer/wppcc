import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Title(),
        titleSpacing: 8,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.teal,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.phone), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _AvatarBackButton(),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Osvaldo Neves',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'online',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

class _AvatarBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.teal,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
          child: Row(
            children: [
              Container(
                child: Icon(Icons.arrow_back),
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage:
                    AssetImage('assets/images/avatar-pic-sample.jpg'),
                radius: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
