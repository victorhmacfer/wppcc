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
      body: Container(
        color: AppColors.lightBrown,
        constraints: BoxConstraints.expand(),
      ),
      bottomSheet: _MyBottomSheet(),
    );
  }
}

class _MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBrown,
      constraints: BoxConstraints(minHeight: 56, maxHeight: 144),
      padding: EdgeInsets.fromLTRB(6,4,4,4),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center, // TODO: this should be center for one line textfield, bottomCenter for multiple lines
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.sentiment_very_satisfied, size: 26),
                    ),
                    Expanded(
                      child: TextField(
                        showCursor: true,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type a message'),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.camera_alt, size: 25),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            SizedBox(width: 4),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.lightTeal,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(Icons.mic, color: AppColors.white, size: 26),
            ),
          ],
        ),
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
        onTap: () {
          Navigator.pop(context);
        },
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
