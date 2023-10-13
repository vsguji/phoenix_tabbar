import 'package:flutter/material.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart';
import 'package:phoenix_tabbar/phoenix_tabbar.dart';

class BrnTabbarStickyExample extends StatefulWidget {
  @override
  _BrnTabbarStickyExampleState createState() => _BrnTabbarStickyExampleState();
}

class _BrnTabbarStickyExampleState extends State<BrnTabbarStickyExample>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  GlobalKey globalKey = GlobalKey();

  ScrollController scrollController = ScrollController();

  CloseWindowController? closeWindowController;
  List<BadgeTab> tabs = <BadgeTab>[];

  @override
  void initState() {
    super.initState();
    tabs.add(BadgeTab(text: "业务一", badgeNum: 23));
    tabs.add(BadgeTab(text: "业务二"));
    tabs.add(BadgeTab(text: "业务三"));
    tabs.add(BadgeTab(text: "业务四"));
    tabs.add(BadgeTab(text: "业务五"));
    tabs.add(BadgeTab(text: "业务六"));
    tabController = TabController(length: tabs.length, vsync: this);
    closeWindowController = CloseWindowController();
    scrollController.addListener(() {
      closeWindowController!.closeMoreWindow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: PhoenixAppBar(
            title: 'TabBar Sticky 效果',
          ),
          body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                buildHeaderWidget(),
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                        child: PhoenixTabBar(
                      controller: tabController,
                      tabs: tabs,
                      showMore: true,
                      moreWindowText: "Tabs描述",
                      onTap: (state, index) {
                        state.refreshBadgeState(index);
                        scrollController.animateTo(
                            globalKey.currentContext!.size!.height,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      onMorePop: () {},
                      closeController: closeWindowController,
                    )),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                const Center(child: Text('业务一')),
                const Center(child: Text('业务二')),
                const Center(child: Text('业务三')),
                const Center(child: Text('业务四')),
                const Center(child: Text('业务五')),
                const Center(child: Text('业务六')),
              ],
            ),
          ),
        ),
        onWillPop: () {
          if (closeWindowController!.isShow) {
            closeWindowController!.closeMoreWindow();
            return Future.value(false);
          }
          return Future.value(true);
        });
  }

  Widget buildHeaderWidget() {
    return SliverToBoxAdapter(
      child: Container(
        key: globalKey,
        child: const Image(
          image: AssetImage("assets/image/image_sticky_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PhoenixTabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.tabHeight ?? 50;

  @override
  double get minExtent => this.child.tabHeight ?? 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
