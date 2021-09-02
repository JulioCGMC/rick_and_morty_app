import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/components/location_card.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/locations_controller.dart';

class LocationsTab extends StatelessWidget {
  final LocationsController controller = Modular.get();

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
            "Localizações", 
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.left,
          )  
        ),
        Expanded(
          child: Observer(
            name: "Locations observer",
            builder: (context) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4/3
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              itemCount: controller.locations.length+1,
              itemBuilder: (context, index) {
                if(index < controller.locations.length) return LocationCard(
                  location: controller.locations.elementAt(index));
                /// Has no more
                else if (controller.locations.length % 20 != 0) return Container();
                /// Add more to the list
                else {
                  controller.addLocations();
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