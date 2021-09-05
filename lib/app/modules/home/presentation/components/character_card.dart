import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/custom_text_theme.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/characters_controller.dart';

class CharacterCard extends StatelessWidget {
  final CharactersController controller = Modular.get();
  final Character character;

  CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(12);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image(context, borderRadius),
        _info(context)
      ],
    );
  }

  Widget _image(BuildContext context, BorderRadius borderRadius) 
    => Container(
    width: 0.4.sw,
    height: 0.4.sw,
    decoration: BoxDecoration(
      borderRadius: borderRadius,
      color: DefaultStyle.currentTheme(context).primary,
    ),
    child: ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(character.image),
    )
  );

  Widget _info(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(vertical: 20.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(character.name, style: CustomTextTheme.currentTheme(context).headline4),
        Text("Espécie: ${character.species}", style: CustomTextTheme.currentTheme(context).subtitle1),
        Text("Gênero: ${character.gender.name}", style: CustomTextTheme.currentTheme(context).subtitle1),
        Text("Situação atual: ${character.status.name}", style: CustomTextTheme.currentTheme(context).subtitle1),
      ],
    ),
  );
}