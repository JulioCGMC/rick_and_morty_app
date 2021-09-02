import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/episode_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/episodes_controller.dart';

class EpisodesTab extends StatefulWidget {
  const EpisodesTab({ Key? key }) : super(key: key);

  @override
  _EpisodesTabState createState() => _EpisodesTabState();
}

class _EpisodesTabState extends ModularState<EpisodesTab,EpisodesController> {
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
            "Episódios", 
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.left,
          )  
        ),
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
                          DefaultStyle.currentTheme.primary)
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