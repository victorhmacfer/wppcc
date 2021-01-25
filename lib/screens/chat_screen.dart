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
          padding:
              EdgeInsets.only(bottom: bottomSheetDefaultHeight + 4, top: 4),
          children: [
            MessageTile(sent: false),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
            SizedBox(height: spacerHeight),
            MessageTile(),
            MessageTile(),
            SizedBox(height: spacerHeight),
            MessageTile(sent: false),
          ],
        ),
      ),
      bottomSheet: _BottomSheet(),
    );
  }
}

class MessageTile extends StatelessWidget {
  final bool sent;

  MessageTile({this.sent = true});

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(lorem(), style: TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '15:23',
                    style: TextStyle(
                        fontSize: 12, color: AppColors.coloredBubbleGrey),
                  ),
                  (sent)
                      ? Container(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.done_all,
                              size: 18, color: AppColors.coloredBubbleGrey))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheet extends StatefulWidget {
  @override
  __BottomSheetState createState() => __BottomSheetState();
}

class __BottomSheetState extends State<_BottomSheet> {
  final messageTextController = TextEditingController();

  Icon sendButtonIcon;

  @override
  void initState() {
    super.initState();
    sendButtonIcon = Icon(Icons.mic, color: AppColors.white, size: 26);
  }

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
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
                        child: Icon(
                          Icons.sentiment_very_satisfied,
                          size: 26,
                          color: AppColors.chatFieldIconGrey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: messageTextController,
                          onChanged: (text) {
                            if (text.isEmpty) {
                              setState(() {
                                sendButtonIcon = Icon(Icons.mic, color: AppColors.white, size: 26);
                              });
                            } else if (text.length == 1) {
                              setState(() {
                                sendButtonIcon = Icon(Icons.send, color: AppColors.white, size: 22);
                              });
                            }
                          },
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
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
                        child: Icon(
                          Icons.camera_alt,
                          size: 25,
                          color: AppColors.chatFieldIconGrey,
                        ),
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.lightTeal,
                borderRadius: BorderRadius.circular(24),
              ),
              child: sendButtonIcon,
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
