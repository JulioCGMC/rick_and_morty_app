import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/custom_text_theme.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/episode.dart';

import '../controllers/episode_controller.dart';

class EpisodePage extends StatelessWidget {
  final EpisodeController controller = Modular.get();
  final Episode episode;

  EpisodePage({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h+padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(episode.name, 
              style: CustomTextTheme.currentTheme.headline3, 
              textAlign: TextAlign.center
            ),
            SizedBox(height: 10.h),
            Text("Ao ár em: ${translateDate(episode.episodeCode)}", 
              style: CustomTextTheme.currentTheme.subtitle2, 
              textAlign: TextAlign.center
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.03.sh+padding.top, 
                left: 0.05.sw, bottom: 10.h),
              child: Text(
                "Personagens no episódio:", 
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              )  
            ),
            _charactersGrid(context)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pop(),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  Widget _charactersGrid(BuildContext context) => Expanded(
    child: GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.w
      ),
      itemCount: episode.characters.length,
      itemBuilder: (context, index) => FutureBuilder<Character?>(
        future: controller.getFeaturedCharacter(episode.characters[index]),
        builder: (context, snapshot) {
          if (snapshot.data == null) return Image.asset(
            "assets/img/placeholder.png",
            fit: BoxFit.fitHeight,
          );
          else return Container(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/img/placeholder.png", 
                    image: snapshot.data!.image,
                    fit: BoxFit.fitWidth,
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                      color: Colors.black.withOpacity(0.4)
                    ),
                    child: Text(snapshot.data!.name, 
                      style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    ),
  );
}