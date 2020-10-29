import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.brightGreen,
          child: Icon(
            Icons.message,
            size: 22,
          ),
        ),
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
            ChatListPage(),
            FakePage('Status'),
            FakePage('Calls'),
          ],
        ),
      ),
    );
  }
}

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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
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
                        SizedBox(width: 48),
                        Text('12:23', style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.done_all, size: 16),
                            SizedBox(width: 4),
                            Text("farei isso"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.volume_mute),
                            Icon(Icons.pin_drop),
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

class FakePage extends StatelessWidget {
  final String name;

  const FakePage(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name),
    );
  }
}
