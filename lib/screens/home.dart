import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';
import 'package:wppcc/widgets/chat_list.dart';

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
