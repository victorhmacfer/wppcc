import 'package:flutter/material.dart';
import 'package:wppcc/colors.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            FakeChatsPage(),
            FakeChatsPage(),
            FakeChatsPage(),
          ],
        ),
      ),
    );
  }
}

class FakeChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.blue,
          height: 72,
        ),
        Container(
          color: Colors.red,
          height: 72,
        ),
        Container(
          color: Colors.yellow,
          height: 72,
        ),
        Container(
          color: Colors.purple,
          height: 72,
        ),
        Container(
          color: Colors.blue,
          height: 72,
        ),
        Container(
          color: Colors.red,
          height: 72,
        ),
        Container(
          color: Colors.yellow,
          height: 72,
        ),
        Container(
          color: Colors.purple,
          height: 72,
        ),
        Container(
          color: Colors.blue,
          height: 72,
        ),
        Container(
          color: Colors.red,
          height: 72,
        ),
        Container(
          color: Colors.yellow,
          height: 72,
        ),
        Container(
          color: Colors.purple,
          height: 72,
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
        ),
        body: Container(
          color: AppColors.teal,
          constraints: BoxConstraints.expand(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('WhatsApp'),
                backgroundColor: AppColors.teal,
                elevation: 0,
                actions: [
                  IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                ],
                floating: true,
              ),
              MySliverTabBar(),
              // MySliverListForTesting(),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.purple[100],
                  constraints: BoxConstraints(),
                  height: 400,
                  child: TabBarView(
                    children: [
                      Container(
                        color: Colors.blue,
                        child: Text('queota'),
                      ),
                      Container(
                        color: Colors.red,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.purple,
                              height: 72,
                            ),
                            Container(
                              color: Colors.orange,
                              height: 72,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 72,
                            ),
                            Container(
                              color: Colors.black,
                              height: 72,
                            ),
                            Container(
                              color: Colors.purple,
                              height: 72,
                            ),
                            Container(
                              color: Colors.orange,
                              height: 72,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 72,
                            ),
                            Container(
                              color: Colors.black,
                              height: 72,
                            ),
                            Container(
                              color: Colors.purple,
                              height: 72,
                            ),
                            Container(
                              color: Colors.orange,
                              height: 72,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 72,
                            ),
                            Container(
                              color: Colors.black,
                              height: 72,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: Text('queota'),
                      ),
                      Container(
                        color: Colors.orange,
                        child: Text('queota'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MyCustomSPHD(),
    );
  }
}

class MyCustomSPHD extends SliverPersistentHeaderDelegate {
  static const double tabBarHeight = 48;

  @override
  double get maxExtent => tabBarHeight;

  @override
  double get minExtent => tabBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var screenWidth = MediaQuery.of(context).size.width;

    const int numOfTabs = 4;
    const double cameraIconSize = 22;
    const double totalCameraIconSize = cameraIconSize + 2 * 12;

    double textLabelWidth =
        (screenWidth - totalCameraIconSize) / (numOfTabs - 1);

    return Container(
      color: AppColors.teal,
      child: TabBar(
        isScrollable: true,
        labelPadding: EdgeInsets.zero,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.white50pct,
        indicatorColor: AppColors.white,
        tabs: [
          SizedBox(
            width: totalCameraIconSize,
            child: Tab(
              icon: Icon(
                Icons.camera_alt,
                size: cameraIconSize,
              ),
            ),
          ),
          SizedBox(
            width: textLabelWidth,
            child: Tab(text: 'CHATS'),
          ),
          SizedBox(
            width: textLabelWidth,
            child: Tab(text: 'STATUS'),
          ),
          SizedBox(
            width: textLabelWidth,
            child: Tab(text: 'CALLS'),
          ),
        ],
      ),
    );
  }
}

class MySliverListForTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate.fixed([
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
      Container(
        color: AppColors.white,
        height: 88,
        alignment: Alignment.center,
        child: Text('blabla'),
      ),
    ]));
  }
}
