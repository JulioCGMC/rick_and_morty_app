import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/bottom_bar_widget.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/pages/tabs/characters_tab.dart';

import '../controllers/home_controller.dart';
import 'tabs/episodes_tab.dart';
import 'tabs/gifs_tab.dart';
import 'tabs/locations_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  int currentPage = 0;
  late final PageController _pageController;

  _HomePageState() {
    _pageController = PageController(initialPage: currentPage);
  }

  changeIndex(int newIndex, [bool updateController = false]) {
    if (updateController) {
      _pageController.animateToPage(newIndex, 
        duration: Duration(microseconds: 300), curve: Curves.easeIn);
    };
    setState(() { currentPage = newIndex; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: changeIndex,
        children: <Widget>[
          EpisodesTab(),
          CharactersTab(),
          LocationsTab(),
          GifsTab(),
        ]
      ),
      bottomNavigationBar: BottomBarWidget(
        currentIndex: currentPage,
        onTap: changeIndex,
      ),
    );
  }
}