import 'package:flutter/material.dart';
import 'package:phoenix_line/phoenix_line.dart';
import 'package:phoenix_tag/phoenix_tag.dart';

/// 列表项
class ListItem extends StatefulWidget {
  /// 点击事件
  final VoidCallback? onPressed;

  /// 标题
  final String title;
  final double? titleFontSize;
  final Color? titleColor;
  final String? imgPath;

  /// 描述
  final String describe;
  final Color describeColor;

  /// 右侧控件
  final Widget? rightWidget;
  final bool isSupportTheme;
  final bool isShowLine;

  /// 构造函数
  ListItem({
    Key? key,
    this.onPressed,
    this.title = "",
    this.titleFontSize,
    this.titleColor,
    this.describe = "",
    this.describeColor = const Color(0xFF999999),
    this.rightWidget,
    this.imgPath,
    this.isSupportTheme = false,
    this.isShowLine = true,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isShowLine
                  ? const Line(
                      color: Color(0xFFEEEEEE),
                      height: 1,
                    )
                  : Container(),
              const Line(
                height: 14,
                color: Colors.transparent,
              ),
              Wrap(children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.titleColor ?? const Color(0xFF222222),
                      fontSize: widget.titleFontSize ?? 14),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                ),
                widget.isSupportTheme
                    ? TagCustom(
                        tagText: "可定制",
                        textPadding: const EdgeInsets.only(
                            bottom: 0, left: 4, right: 4, top: 0),
                        textColor: const Color(0xFFFF5722),
                        backgroundColor: const Color(0x24FF5722),
                      )
                    : Container()
              ]),
              const Padding(padding: EdgeInsets.all(2)),
              Text(
                widget.describe,
                style: TextStyle(color: widget.describeColor, fontSize: 12),
              ),
              const Line(
                height: 14,
                color: Colors.transparent,
              )
            ],
          )),
    );
  }
}
