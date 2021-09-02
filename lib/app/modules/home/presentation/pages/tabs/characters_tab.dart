import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/character_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/characters_controller.dart';

class CharactersTab extends StatelessWidget {
  final CharactersController controller = Modular.get();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0.03.sh+padding.top, 
            left: 0.04.sw, bottom: 10.h),
          child: Text(
            "Personagens", 
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.left,
          )  
        ),
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
                            DefaultStyle.currentTheme.primary)
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
        color: DefaultStyle.currentTheme.onPrimary,
        disabledColor: Colors.grey[800],
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
        color: DefaultStyle.currentTheme.onPrimary,
      ),
    ],
  );
}