import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_n_morty_app/app/core/constants/custom_text_theme.dart';
import 'package:rick_n_morty_app/app/core/constants/default_style.dart';
import 'package:rick_n_morty_app/app/core/functions/functions.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/character.dart';
import 'package:rick_n_morty_app/app/modules/home/domain/entities/location.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/controllers/locations_controller.dart';

class LocationCard extends StatelessWidget {
  final LocationsController controller = Modular.get();
  final Location location;

  LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(8);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: _info(context, location),
    );
  }

  Widget _info(BuildContext context, Location location) => Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(location.name, style: CustomTextTheme().headline6),
        Text("População: ${location.residents?.length ?? ''}", 
          style: CustomTextTheme().subtitle2),
        Text("Tipo: ${location.type ?? ''}", 
          style: CustomTextTheme().subtitle2),
        Text("Local: ${location.dimension ?? ''}", 
          style: CustomTextTheme().subtitle2),
      ],
    ),
  );
}