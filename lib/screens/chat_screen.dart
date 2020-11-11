import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';

const double bottomSheetDefaultHeight = 56;

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double spacerHeight = 8;

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
          padding: EdgeInsets.only(bottom: bottomSheetDefaultHeight + 4, top: 4),
          children: [
            MessageTile(Colors.yellow[200], false),
            MessageTile(Colors.blue[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.orange[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.indigo[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.red[200]),
            MessageTile(Colors.brown[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.pink[200], false),
            MessageTile(Colors.yellow[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.blue[200]),
            MessageTile(Colors.orange[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.indigo[200], false),
            MessageTile(Colors.red[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.brown[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.pink[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.yellow[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.blue[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.orange[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.indigo[200], false),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.red[200]),
            MessageTile(Colors.brown[200]),
            SizedBox(height: spacerHeight),
            MessageTile(Colors.pink[200], false),
          ],
        ),
      ),
      bottomSheet: _BottomSheet(),
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
      color: AppColors.lightBrown,
      child: MessageBubble(sent),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool sent;

  MessageBubble(this.sent);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 336),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          color: (sent) ? AppColors.bubbleGreen : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.2), offset: Offset(0, 0.5)),
          ]),
      child: Container(
        // color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                // color: Colors.yellow,
                padding: EdgeInsets.only(bottom: 4),
                child: Text(lorem(), style: TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.only(left: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '15:23',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.done_all, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightBrown,
      constraints:
          BoxConstraints(minHeight: bottomSheetDefaultHeight, maxHeight: 144),
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.sentiment_very_satisfied, size: 26),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          style: TextStyle(fontSize: 18),
                          showCursor: true,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Type a message'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.camera_alt, size: 25),
                      ),
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

  var rand = Random().nextInt(max) + 1;

  var sub = words.sublist(0, rand);
  return sub.join(" ");
}
