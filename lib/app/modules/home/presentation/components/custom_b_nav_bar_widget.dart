import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomBNavBarWidget extends StatefulWidget {
  final PageController controller;

  CustomBNavBarWidget({required this.controller});

  @override
  _CustomBNavBarWidgetState createState() => _CustomBNavBarWidgetState();
}

class _CustomBNavBarWidgetState extends State<CustomBNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 7,
      child: Container(
        height: 60,
        child: _itemArrangement(),
      )
    );
  }

  Widget _itemArrangement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        item(
          text: 'Início',
          icon: MaterialIcons.home,
          index: 0
        ),
        item(
          text: 'Início',
          icon: MaterialIcons.home,
          index: 1
        ),
        item(
          text: 'Início',
          icon: MaterialIcons.home,
          index: 2
        ),
        item(
          text: 'Início',
          icon: MaterialIcons.home,
          index: 2
        )
      ],
    );
  }

  Widget item({required String text, required IconData icon, required int index}) {
    Color? color;
    int page = (widget.controller.page != null 
      ? widget.controller.page!.round() : 0);
    if (index == page) {
      color = Theme.of(context).primaryColor;
    }
    return MaterialButton(
      minWidth: 40.w,
      onPressed: () => setState(() {
        widget.controller.jumpToPage(index);
      }),
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 8.h,
            color: color ?? Colors.transparent,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color ?? Colors.grey,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.caption!.apply(
                    color: color ?? Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
