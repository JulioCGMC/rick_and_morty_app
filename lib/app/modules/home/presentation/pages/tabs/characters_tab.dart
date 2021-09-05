import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/character_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/title_bar_widget.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/characters_controller.dart';

class CharactersTab extends StatelessWidget {
  final CharactersController controller = Modular.get();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBarWidget(title: "Personagens"),
        Expanded(
          child: Observer(
            name: "Characters observer",
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: PageView.builder(
                controller: _pageController,
                itemCount: controller.characters.length+1,
                itemBuilder: (context, index) {
                  if (index < controller.characters.length) 
                    return _item(context,index);
                  /// Has no more
                  else if (controller.characters.length % 20 != 0) return Container();
                  /// Add more to the list
                  else {
                    controller.addCharacters();
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            DefaultStyle.currentTheme(context).primary)
                        ),
                      )
                    );
                  }
                }
              ),
            )
          ),
        ),
      ],
    );
  }

  Widget _item(BuildContext context, int index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: index > 0 ? () {
          _pageController.animateToPage(_pageController.page!.round()-1, 
            duration: Duration(milliseconds: 300), 
            curve: Curves.bounceIn);
        } : null,
        icon: Icon(Icons.arrow_back_ios),
        color: DefaultStyle.currentTheme(context).onBackground,
        disabledColor: DefaultStyle.currentTheme(context).surface,
      ),
      CharacterCard(character: controller.characters.elementAt(index)),
      IconButton(
        onPressed: (controller.characters.length % 20 == 0 
        && index < controller.characters.length) ? () {
          _pageController.animateToPage(_pageController.page!.round()+1, 
            duration: Duration(milliseconds: 300), 
            curve: Curves.bounceIn);
        } : null,
        icon: Icon(Icons.arrow_forward_ios),
        color: DefaultStyle.currentTheme(context).onBackground,
        disabledColor: DefaultStyle.currentTheme(context).surface,
      ),
    ],
  );
}