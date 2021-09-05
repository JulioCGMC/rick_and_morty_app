import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/episode_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/title_bar_widget.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/episodes_controller.dart';

class EpisodesTab extends StatefulWidget {
  const EpisodesTab({ Key? key }) : super(key: key);

  @override
  _EpisodesTabState createState() => _EpisodesTabState();
}

class _EpisodesTabState extends ModularState<EpisodesTab,EpisodesController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleBarWidget(title: "Episódios"),
        Expanded(
          child: Observer(
            name: "Episodes observer",
            builder: (context) => ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: controller.episodes.length+1,
              itemBuilder: (context, index) {
                if(index < controller.episodes.length) return EpisodeCard(
                  episode: controller.episodes.elementAt(index));
                /// Has no more
                else if (controller.episodes.length % 20 != 0) return Container();
                /// Add more to the list
                else {
                  controller.addEpisodes();
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
            )
          ),
        ),
      ],
    );
  }
}