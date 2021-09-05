import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';

class BottomBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int, bool)? onTap;

  BottomBarWidget({Key? key, this.currentIndex = 0, 
    this.onTap}) : super(key: key);
  
  final List<Map<String,dynamic>> items = const [
    {'label': 'Episódios', 'icon': MaterialIcons.video_library},
    {'label': 'Personagens', 'icon': FontAwesome5Solid.user_friends},
    {'label': 'Locais', 'icon': Ionicons.planet_sharp},
    {'label': 'Gifs', 'icon': Entypo.video}
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 7,
      child: Container(
        height: 60,
        child: _itemArrangement(context),
      )
    );
  }

  Widget _itemArrangement(BuildContext context) {
    List<Widget> children = [];
    for (var index = 0; index < items.length; index++) {
      children.add(item(context, items[index]['label'], 
        items[index]['icon'], index));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget item(BuildContext context, String text, IconData icon, int index) {
    Color? color;
    if (index == currentIndex) {
      color = DefaultStyle.currentTheme(context).primary;
    }
    return MaterialButton(
      minWidth: 40.w,
      onPressed: () => onTap!(index, true),
      child: Column(
        children: [
          Container(
            width: 50.w,
            height: 6.h,
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
  //   return BottomAppBar(
  //     shape: CircularNotchedRectangle(),
  //     notchMargin: 7,
  //     child: Container(
  //       height: 60,
  //       child: _itemArrangement(),
  //     )
  //   );
  //   BottomNavigationBar(
  //     currentIndex: currentIndex,
  //     backgroundColor: DefaultStyle.currentTheme(context).surface,
  //     onTap: (index) => onTap!(index, true),
  //     items: <BottomNavigationBarItem>[
  //       BottomNavigationBarItem( icon: Icon(Icons.add), "Label",
        //  tooltip: "Label"
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.add),
  //         label: "Label",
  //         tooltip: "Label"
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.add),
  //         label: "Label",
  //         tooltip: "Label"
  //       )
  //     ]
  //   );
  // }
}