import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> changeCurrentTab;

  BottomNavBar({Key key, this.changeCurrentTab}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int tab = 0;

  Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: size.getWidthPx(24),
      currentIndex: tab,
      unselectedItemColor: Colors.black45,
      selectedItemColor: colorCurve,
      elevation: 150.0,
      unselectedFontSize: displayWidth(context) * 0.033,
      selectedFontSize: displayWidth(context) * 0.037,
      showUnselectedLabels: true,
      onTap: (int index) {
        setState(() {
          if (index != 4) {
            tab = index;
            widget.changeCurrentTab(index);
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.grey.shade50,
          icon: Icon(Icons.home),
          title: Text('Moje obiekty', style: TextStyle(fontFamily: 'Exo2')),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.grey.shade50,
          icon: Icon(Icons.calendar_today),
          title: Text('Terminarz', style: TextStyle(fontFamily: 'Exo2')),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.grey.shade50,
          icon: Icon(Icons.settings),
          title: Text('Ustawienia', style: TextStyle(fontFamily: 'Exo2')),
        ),
      ],
    );
  }
}
