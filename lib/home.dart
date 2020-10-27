import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text('WhatsApp'),
          backgroundColor: AppColors.teal,
          elevation: 0,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.white50pct,
            indicatorColor: AppColors.white,
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatsPage(),
            FakePage(),
            FakePage(),
          ],
        ),
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 7,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 76,
        endIndent: 12,
      ),
      itemBuilder: (context, index) {
        return ChatTile();
      },
    );
  }
}

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: () {},
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
                        SizedBox(
                          width: 48,
                        ),
                        Text(
                          '12:23',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("farei isso"),
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

class FakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(color: Colors.blue, height: 72),
        Container(color: Colors.red, height: 72),
        Container(color: Colors.yellow, height: 72),
        Container(color: Colors.purple, height: 72),
        Container(color: Colors.blue, height: 72),
        Container(color: Colors.red, height: 72),
        Container(color: Colors.yellow, height: 72),
        Container(color: Colors.purple, height: 72),
        Container(color: Colors.blue, height: 72),
        Container(color: Colors.red, height: 72),
        Container(color: Colors.yellow, height: 72),
        Container(color: Colors.purple, height: 72),
      ],
    );
  }
}
