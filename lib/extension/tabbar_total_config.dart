/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-21 23:04:55
import 'tabbar_default_config_utils.dart';
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-21 23:17:55
 * @FilePath: /phoenix_tabbar/lib/extension/tabbar_total_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:phoenix_base/phoenix.dart';

import '../config/tabbar_config.dart';
import 'tabbar_default_config_utils.dart';

class TabBarTotalConfig extends BaseTotalConfig {
  TabBarTotalConfig({BaseTabBarConfig? tabBarConfig})
      : _tabBarConfig = tabBarConfig;

  BaseTabBarConfig? _tabBarConfig;

  BaseTabBarConfig get tabBarConfig =>
      _tabBarConfig ?? BaseTabBarConfigUtils.defaultTabBarConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _tabBarConfig ??= BaseTabBarConfig();
    tabBarConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseTabBarTotalConfig on BaseTotalConfig {
  static BaseTabBarConfig? _tabBarConfig;

  ///
  BaseTabBarConfig get tabBarConfig =>
      _tabBarConfig ?? BaseTabBarConfigUtils.defaultTabBarConfig;

  ///
  set tabBarTotalConfig(TabBarTotalConfig config) {
    _tabBarConfig = config.tabBarConfig;
  }
}
