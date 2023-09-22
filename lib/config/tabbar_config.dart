import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_tabbar/extension/tabbar_total_config.dart';

import '../extension/tabbar_default_config_utils.dart';

/// TabBar配置类
class BaseTabBarConfig extends BaseConfig {
  /// 遵循外部主题配置
  /// 默认为 [BrnDefaultConfigUtils.tabBarConfig]
  BaseTabBarConfig({
    double? tabHeight,
    double? indicatorHeight,
    double? indicatorWidth,
    BaseTextStyle? labelStyle,
    BaseTextStyle? unselectedLabelStyle,
    Color? backgroundColor,
    BaseTextStyle? tagNormalTextStyle,
    Color? tagNormalBgColor,
    BaseTextStyle? tagSelectedTextStyle,
    Color? tagSelectedBgColor,
    double? tagRadius,
    double? tagSpacing,
    int? preLineTagCount,
    double? tagHeight,
    String configId = GLOBAL_CONFIG_ID,
  })  : _tabHeight = tabHeight,
        _indicatorHeight = indicatorHeight,
        _indicatorWidth = indicatorWidth,
        _labelStyle = labelStyle,
        _unselectedLabelStyle = unselectedLabelStyle,
        _backgroundColor = backgroundColor,
        _tagNormalTextStyle = tagNormalTextStyle,
        _tagNormalBgColor = tagNormalBgColor,
        _tagSelectedTextStyle = tagSelectedTextStyle,
        _tagSelectedBgColor = tagSelectedBgColor,
        _tagRadius = tagRadius,
        _tagSpacing = tagSpacing,
        _preLineTagCount = preLineTagCount,
        _tagHeight = tagHeight,
        super(configId: configId);

  /// TabBar 的整体高度
  /// 默认为 50
  double? _tabHeight;

  /// 指示器的高度
  /// 默认为 2
  double? _indicatorHeight;

  /// 指示器的宽度
  /// 默认为 24
  double? _indicatorWidth;

  /// 选中 Tab 文本的样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.brandPrimary],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _labelStyle;

  /// 未选中 Tab 文本的样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _unselectedLabelStyle;

  /// 背景色
  /// 默认为 [BrnCommonConfig.fillBase]
  Color? _backgroundColor;

  /// 标签字体样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  /// )
  BaseTextStyle? _tagNormalTextStyle;

  /// 标签背景色
  /// 默认为 [BrnCommonConfig.brandPrimary].withAlpha(0x14),
  Color? _tagNormalBgColor;

  /// 标签字体样式
  ///
  /// BrnTextStyle(
  ///   color:[BrnCommonConfig.brandPrimary],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  /// )
  BaseTextStyle? _tagSelectedTextStyle;

  /// 标签选中背景色
  /// 默认为 [BrnCommonConfig.fillBody]
  Color? _tagSelectedBgColor;

  /// tag圆角
  /// 默认为 [BrnCommonConfig.radiusSm]
  double? _tagRadius;

  /// tag间距
  /// 默认为 12
  double? _tagSpacing;

  /// 每行的tag数
  /// 默认为 4
  int? _preLineTagCount;

  /// tag高度
  /// 默认为 32
  double? _tagHeight;

  double get tabHeight =>
      _tabHeight ?? BaseTabBarConfigUtils.defaultTabBarConfig.tabHeight;

  double get indicatorHeight =>
      _indicatorHeight ??
      BaseTabBarConfigUtils.defaultTabBarConfig.indicatorHeight;

  double get indicatorWidth =>
      _indicatorWidth ??
      BaseTabBarConfigUtils.defaultTabBarConfig.indicatorWidth;

  BaseTextStyle get labelStyle =>
      _labelStyle ?? BaseTabBarConfigUtils.defaultTabBarConfig.labelStyle;

  BaseTextStyle get unselectedLabelStyle =>
      _unselectedLabelStyle ??
      BaseTabBarConfigUtils.defaultTabBarConfig.unselectedLabelStyle;

  Color get backgroundColor =>
      _backgroundColor ??
      BaseTabBarConfigUtils.defaultTabBarConfig.backgroundColor;

  BaseTextStyle get tagNormalTextStyle =>
      _tagNormalTextStyle ??
      BaseTabBarConfigUtils.defaultTabBarConfig.tagNormalTextStyle;

  Color get tagNormalBgColor =>
      _tagNormalBgColor ??
      BaseTabBarConfigUtils.defaultTabBarConfig.tagNormalBgColor;

  BaseTextStyle get tagSelectedTextStyle =>
      _tagSelectedTextStyle ??
      BaseTabBarConfigUtils.defaultTabBarConfig.tagSelectedTextStyle;

  Color get tagSelectedBgColor =>
      _tagSelectedBgColor ??
      BaseTabBarConfigUtils.defaultTabBarConfig.tagSelectedBgColor;

  double get tagRadius =>
      _tagRadius ?? BaseTabBarConfigUtils.defaultTabBarConfig.tagRadius;

  double get tagSpacing =>
      _tagSpacing ?? BaseTabBarConfigUtils.defaultTabBarConfig.tagSpacing;

  int get preLineTagCount =>
      _preLineTagCount ??
      BaseTabBarConfigUtils.defaultTabBarConfig.preLineTagCount;

  double get tagHeight =>
      _tagHeight ?? BaseTabBarConfigUtils.defaultTabBarConfig.tagHeight;

  @override
  void initThemeConfig(
    String configId, {
    BaseCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    BaseTabBarConfig tabBarConfig =
        BaseThemeConfig.instance.getConfig(configId: configId).tabBarConfig;

    _tabHeight ??= tabBarConfig._tabHeight;
    _indicatorHeight ??= tabBarConfig._indicatorHeight;
    _indicatorWidth ??= tabBarConfig._indicatorWidth;
    _labelStyle = tabBarConfig.labelStyle.merge(
      BaseTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_labelStyle),
    );
    _unselectedLabelStyle = tabBarConfig.unselectedLabelStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_unselectedLabelStyle),
    );
    _backgroundColor ??= tabBarConfig._backgroundColor;
    _tagNormalTextStyle = tabBarConfig.tagNormalTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagNormalTextStyle),
    );
    _tagSelectedTextStyle = tabBarConfig.tagSelectedTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_tagSelectedTextStyle),
    );
    _tagNormalBgColor ??= tabBarConfig._tagNormalBgColor;
    _tagSelectedBgColor ??= tabBarConfig._tagSelectedBgColor;
    _tagRadius ??= commonConfig.radiusSm;
    _tagSpacing ??= tabBarConfig._tagSpacing;
    _preLineTagCount ??= tabBarConfig._preLineTagCount;
    _tagHeight ??= tabBarConfig._tagHeight;
  }

  BaseTabBarConfig copyWith({
    double? tabHeight,
    double? indicatorHeight,
    double? indicatorWidth,
    BaseTextStyle? labelStyle,
    BaseTextStyle? unselectedLabelStyle,
    Color? backgroundColor,
    BaseTextStyle? tagNormalTextStyle,
    Color? tagNormalColor,
    BaseTextStyle? tagSelectedTextStyle,
    Color? tagSelectedColor,
    double? tagRadius,
    double? tagSpacing,
    int? preLineTagSize,
    double? tagHeight,
  }) {
    return BaseTabBarConfig(
      tabHeight: tabHeight ?? _tabHeight,
      indicatorHeight: indicatorHeight ?? _indicatorHeight,
      indicatorWidth: indicatorWidth ?? _indicatorWidth,
      labelStyle: labelStyle ?? _labelStyle,
      unselectedLabelStyle: unselectedLabelStyle ?? _unselectedLabelStyle,
      backgroundColor: backgroundColor ?? _backgroundColor,
      tagNormalTextStyle: tagNormalTextStyle ?? _tagNormalTextStyle,
      tagNormalBgColor: tagNormalColor ?? _tagNormalBgColor,
      tagSelectedTextStyle: tagSelectedTextStyle ?? _tagSelectedTextStyle,
      tagSelectedBgColor: tagSelectedColor ?? _tagSelectedBgColor,
      tagRadius: tagRadius ?? _tagRadius,
      tagSpacing: tagSpacing ?? _tagSpacing,
      preLineTagCount: preLineTagSize ?? _preLineTagCount,
      tagHeight: tagHeight ?? _tagHeight,
    );
  }

  BaseTabBarConfig merge(BaseTabBarConfig? other) {
    if (other == null) return this;
    return copyWith(
      tabHeight: other._tabHeight,
      indicatorHeight: other._indicatorHeight,
      indicatorWidth: other._indicatorWidth,
      labelStyle: labelStyle.merge(other._labelStyle),
      unselectedLabelStyle:
          unselectedLabelStyle.merge(other._unselectedLabelStyle),
      backgroundColor: other._backgroundColor,
      tagNormalTextStyle: tagNormalTextStyle.merge(other._tagNormalTextStyle),
      tagNormalColor: other._tagNormalBgColor,
      tagSelectedTextStyle:
          tagSelectedTextStyle.merge(other._tagSelectedTextStyle),
      tagSelectedColor: other._tagSelectedBgColor,
      tagRadius: other._tagRadius,
      tagSpacing: other._tagSpacing,
      preLineTagSize: other._preLineTagCount,
      tagHeight: other._tagHeight,
    );
  }
}
