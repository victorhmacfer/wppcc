import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';
import 'package:wppcc/screens/chat_screen.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const numOfItems = 19 + 1;

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 76),
      itemCount: numOfItems,
      separatorBuilder: (context, index) {
        if (index < numOfItems - 2) {
          return Divider(
            height: 1,
            indent: 76,
            endIndent: 12,
          );
        }
        return Container();
      },
      itemBuilder: (context, index) {
        return (index != numOfItems - 1) ? ChatTile() : ArchivedLinkTile();
      },
    );
  }
}

class ArchivedLinkTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 48,
          alignment: Alignment.center,
          child: Text(
            'Archived(45)',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: AppColors.chatTileMessageGrey),
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          height: 76,
          child: Row(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundImage:
                    AssetImage('assets/images/avatar-pic-sample.jpg'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Osvaldo Neves',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        SizedBox(width: 48),
                        Text(
                          '12:23',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.chatTileMessageGrey),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.done_all,
                              size: 16,
                              color: AppColors.muteGrey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "farei isso",
                              style: TextStyle(
                                  color: AppColors.chatTileMessageGrey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.volume_mute, color: AppColors.muteGrey),
                            Icon(Icons.pin_drop, color: AppColors.pinGrey),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
