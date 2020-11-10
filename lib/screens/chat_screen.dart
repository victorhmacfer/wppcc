import 'dart:math';

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
        child: ListView(
          children: [
            MessageTile(Colors.yellow[200], false),
            MessageTile(Colors.blue[200], false),
            MessageTile(Colors.orange[200]),
            MessageTile(Colors.indigo[200], false),
            MessageTile(Colors.red[200]),
            MessageTile(Colors.brown[200]),
            MessageTile(Colors.pink[200], false),
            MessageTile(Colors.yellow[200], false),
            MessageTile(Colors.blue[200]),
            MessageTile(Colors.orange[200]),
            MessageTile(Colors.indigo[200], false),
            MessageTile(Colors.red[200], false),
            MessageTile(Colors.brown[200]),
            MessageTile(Colors.pink[200], false),
            MessageTile(Colors.yellow[200]),
            MessageTile(Colors.blue[200], false),
            MessageTile(Colors.orange[200]),
            MessageTile(Colors.indigo[200], false),
            MessageTile(Colors.red[200]),
            MessageTile(Colors.brown[200]),
            MessageTile(Colors.pink[200], false),
          ],
        ),
      ),
      bottomSheet: _MyBottomSheet(),
    );
  }
}

class MessageTile extends StatelessWidget {
  final Color color;
  final bool sent;

  MessageTile(this.color, [this.sent = true]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      alignment: sent ? Alignment.centerRight : Alignment.centerLeft,
      color: color,
      child: MessageBubble(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(maxWidth: 336),
      color: Colors.green[100],
      child: Text(lorem()),
    );
  }
}

class _MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBrown,
      constraints: BoxConstraints(minHeight: 56, maxHeight: 144),
      padding: EdgeInsets.fromLTRB(6, 4, 4, 4),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment
                    .center, // TODO: this should be center for one line textfield, bottomCenter for multiple lines
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

//100 word lorem
const fullLorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tempor, dui ac pellentesque vestibulum, dolor elit dapibus massa, ac consequat ante nisi vitae urna. Morbi lobortis fringilla lorem, a maximus enim porttitor id. Cras vel massa mauris. Aenean at erat efficitur, semper eros nec, sodales tellus. Integer malesuada vulputate mattis. Sed pretium ultrices magna, ac porta ipsum rhoncus ut. Nulla imperdiet ipsum sit amet odio viverra consectetur. Donec cursus mollis erat, quis efficitur neque euismod a. Vestibulum vel massa non mi maximus pellentesque et a lorem. Curabitur vitae facilisis erat, nec aliquam tortor. Nunc vehicula vitae risus quis vehicula. Praesent.";

// generates random length(1 to 100 words) lorem.
String lorem() {
  var words = fullLorem.split(" ");

  var randTen = Random().nextInt(10);
  var max = (randTen < 8) ? 12 : 50;

  var rand = Random().nextInt(max);
  
  var sub = words.sublist(0, rand);
  return sub.join(" ");
}
