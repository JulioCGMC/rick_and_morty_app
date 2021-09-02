import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/custom_text_theme.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/episodes_controller.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodesController controller = Modular.get();
  final Episode episode;

  EpisodeCard({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(22);
    return InkWell(
      onTap: () => controller.showEpisode(episode),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          height: 0.2.sh,
          child: Row(
            children: [
              _image(context, borderRadius),
              Expanded(child: _info(context, episode),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(BuildContext context, episode) => Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(episode.name,
              style: CustomTextTheme().headline6),
            Text(episode.episodeCode, 
              style: CustomTextTheme().subtitle2),
          ],
        ),
        Text(translateDate(episode.airDate), 
          style: CustomTextTheme().subtitle2,
          textAlign: TextAlign.right
        ),
      ],
    ),
  );

  Widget _image(BuildContext context, BorderRadius borderRadius) 
    => Container(
    width: 0.4.sw,
    height: 0.2.sh,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.horizontal(
        left: borderRadius.topLeft
      ),
      color: DefaultStyle.currentTheme.primary,
    ),
    child: FutureBuilder<Character?>(
      future: controller.getRandomFeaturedCharacter(episode.characters),
      builder: (context, snapshot) {
        if (snapshot.data == null) return Image.asset(
          "assets/img/placeholder.png",
          fit: BoxFit.fitHeight,
        );
        else return ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: borderRadius.topLeft
          ),
          child: FadeInImage.assetNetwork(
            placeholder: "assets/img/placeholder.png", 
            image: snapshot.data!.image,
            fit: BoxFit.fitWidth
          )
        );
      }
    ),
  );
}