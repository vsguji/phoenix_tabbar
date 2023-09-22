/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-07-24 14:41:29
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-21 23:14:42
 * @FilePath: /phoenix_tabbar/lib/config/tabbar_default_config_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import '../config/tabbar_config.dart';

/// TabBar配置
extension BaseTabBarConfigUtils on BaseDefaultConfigUtils {
  //
  static BaseTabBarConfig defaultTabBarConfig = BaseTabBarConfig(
    backgroundColor: Colors.white,
    tabHeight: 50.0,
    indicatorHeight: 2.0,
    indicatorWidth: 24.0,
    labelStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandPrimary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.normal,
    ),
    tagRadius: BaseDefaultConfigUtils.defaultCommonConfig.radiusSm,
    tagNormalTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
    ),
    tagNormalBgColor: BaseDefaultConfigUtils.defaultCommonConfig.fillBody,
    tagSelectedTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandPrimary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
    ),
    tagSelectedBgColor:
        BaseDefaultConfigUtils.defaultCommonConfig.brandPrimary.withAlpha(0x14),
    tagSpacing: 12.0,
    preLineTagCount: 4,
    tagHeight: 32.0,
  );
}
