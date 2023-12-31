import 'package:flutter/material.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart';
import 'package:phoenix_tabbar/phoenix_tabbar.dart';
import 'package:phoenix_toast/phoenix_toast.dart';

import 'tabbar_sticky_example.dart';
import 'list_item.dart';

class TabExample extends StatefulWidget {
  @override
  _TabExampleState createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample> with TickerProviderStateMixin {
  CloseWindowController? closeWindowController;

  @override
  void initState() {
    super.initState();
    closeWindowController = CloseWindowController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: PhoenixAppBar(
            title: 'BrnTab示例',
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListItem(
                  title: "BrnTabBarBadge实现",
                  isShowLine: false,
                ),
                const Divider(),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TabbarStickyExample();
                      }));
                    },
                    child: const Text("Tabbar点击自动收起example"),
                  ),
                ),
                const Divider(),
                _createExpandedMoreTabbarWidgets(),
                const Divider(),
                _createStableTabbar4Widgets(),
                const Divider(),
                _createStableTabbarWidgets(),
                const Divider(),
                _createTabbarBadgeWidgets(),
                const Divider(),
                _createStableTabbarBadgeWidgets(),
                const Divider(),
                _createDividerTabbarWidgets(),
                const Divider(),
                _createCustomTabbarWidgets(),
                const Divider(),
                _createTopTabbarWidgets(),
                const Divider(),
                _createTopTabbarCountWidgets(),
                const Divider(),
                _createOriginWidgets(),
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

  _createExpandedMoreTabbarWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一"));
    tabs.add(BadgeTab(text: "业务二"));
    tabs.add(BadgeTab(text: "业务三"));
    tabs.add(BadgeTab(text: "业务四"));
    tabs.add(BadgeTab(text: "业务五"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      showMore: true,
      moreWindowText: "Tabs描述",
      closeController: closeWindowController,
      onTap: (state, index) {
        state.refreshBadgeState(index);
      },
    );
  }

  _createStableTabbar4Widgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一"));
    tabs.add(BadgeTab(text: "业务二"));
    tabs.add(BadgeTab(text: "业务三"));
    tabs.add(BadgeTab(text: "业务四"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      onTap: (state, index) {
        state.refreshBadgeState(index);
      },
    );
  }

  _createStableTabbarWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "特殊业务详情一", badgeText: "新"));
    tabs.add(BadgeTab(text: "业务二", badgeNum: 22));
    tabs.add(BadgeTab(text: "业务三", badgeNum: 11));
    tabs.add(BadgeTab(text: "业务四", showRedBadge: true));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      mode: BrnTabBarBadgeMode.origin,
      isScroll: false,
      labelPadding: const EdgeInsets.only(left: 20, right: 12),
      indicatorPadding: const EdgeInsets.only(left: 10),
      onTap: (state, index) {
        PhoenixToast.show("点击了", context);
      },
    );
  }

  _createTabbarBadgeWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一", badgeText: "新"));
    tabs.add(BadgeTab(text: "业务二", badgeNum: 22));
    tabs.add(BadgeTab(text: "业务三", badgeNum: 11));
    tabs.add(BadgeTab(text: "业务四", showRedBadge: true));
    tabs.add(BadgeTab(text: "业务五", badgeNum: 12));
    tabs.add(BadgeTab(text: "业务六", badgeNum: 30));
    tabs.add(BadgeTab(text: "业务七"));
    tabs.add(BadgeTab(text: "业务八", badgeNum: 23));
    tabs.add(BadgeTab(text: "业务九", badgeNum: 43));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      onTap: (state, index) {
        state.refreshBadgeState(index);
      },
    );
  }

  _createStableTabbarBadgeWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一", badgeNum: 100));
    tabs.add(BadgeTab(text: "业务二", badgeNum: 22));
    tabs.add(BadgeTab(text: "业务三", badgeNum: 11));
    tabs.add(BadgeTab(text: "业务四"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      onTap: (state, index) {
        state.refreshBadgeState(index);
      },
    );
  }

  _createDividerTabbarWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一", topText: "1"));
    tabs.add(BadgeTab(text: "业务二", topText: "2"));
    tabs.add(BadgeTab(text: "业务三", topText: "3"));
    tabs.add(BadgeTab(text: "业务四", topText: "4"));
    tabs.add(BadgeTab(text: "业务五", topText: "5"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      hasIndex: true,
      hasDivider: true,
      onTap: (state, index) {},
    );
  }

  ///
  /// 自定义Tab宽度，如果tab宽度之和大于屏幕宽度，默认能左右滚动
  ///
  _createCustomTabbarWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一", badgeNum: 2));
    tabs.add(BadgeTab(text: "业务二"));
    tabs.add(BadgeTab(text: "业务三", badgeNum: 33));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      tabWidth: 80,
      hasIndex: true,
      hasDivider: false,
      onTap: (state, index) {},
    );
  }

  _createTopTabbarWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "08月09日", topText: "今天"));
    tabs.add(BadgeTab(text: "08月10日", topText: "明天"));
    tabs.add(BadgeTab(text: "08月11日", topText: "周三"));
    tabs.add(BadgeTab(text: "08月12日", topText: "周四"));
    tabs.add(BadgeTab(text: "08月13日", topText: "周五"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      hasIndex: true,
      labelColor: const Color(0xFF21C1B5),
      indicatorColor: const Color(0xFF21C1B5),
      hasDivider: true,
      onTap: (state, index) {},
    );
  }

  _createTopTabbarCountWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "08月09日", topText: "今天"));
    tabs.add(BadgeTab(text: "08月10日", topText: "明天"));
    tabs.add(BadgeTab(text: "08月11日", topText: "周三"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      hasIndex: true,
      labelColor: const Color(0xFF21C1B5),
      indicatorColor: const Color(0xFF21C1B5),
      hasDivider: true,
      onTap: (state, index) {},
    );
  }

  _createOriginWidgets() {
    var tabs = <BadgeTab>[];
    tabs.add(BadgeTab(text: "业务一", badgeText: "新"));
    tabs.add(BadgeTab(text: "业务二", badgeNum: 22));
    tabs.add(BadgeTab(text: "业务三", badgeNum: 11));
    tabs.add(BadgeTab(text: "业务四", showRedBadge: true));
    tabs.add(BadgeTab(text: "业务五", badgeNum: 12));
    tabs.add(BadgeTab(text: "业务六", badgeNum: 30));
    tabs.add(BadgeTab(text: "业务七"));
    tabs.add(BadgeTab(text: "业务八", badgeNum: 23));
    tabs.add(BadgeTab(text: "业务九"));
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return PhoenixTabBar(
      controller: tabController,
      tabs: tabs,
      mode: BrnTabBarBadgeMode.origin,
      isScroll: false,
      labelPadding: const EdgeInsets.only(left: 20, right: 12),
      indicatorPadding: const EdgeInsets.only(left: 10),
      onTap: (state, index) {},
    );
  }
}
