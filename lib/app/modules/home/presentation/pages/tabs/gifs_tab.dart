import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/gif_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/gifs_controller.dart';

class GifsTab extends StatelessWidget {
  final GifsController controller = Modular.get();

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
            "Gifs", 
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.left,
          )  
        ),
        Expanded(
          child: Observer(
            name: "Gifs observer",
            builder: (context) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: controller.gifs.length+1,
              itemBuilder: (context, index) {
                if(index < controller.gifs.length) return GifCard(
                  gifUrl: controller.gifs.elementAt(index));
                /// Has no more
                else if (controller.gifs.length % 20 != 0) return Container();
                /// Add more to the list
                else {
                  controller.addGifs();
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