import 'package:flutter_modular/flutter_modular.dart';
import 'package:rick_n_morty_app/app/modules/home/presentation/pages/episode_page.dart';

import 'data/repositories/giphy_repository.dart';
import 'data/repositories/rick_n_morty_repository.dart';
import 'presentation/controllers/characters_controller.dart';
import 'presentation/controllers/episode_controller.dart';
import 'presentation/controllers/episodes_controller.dart';
import 'presentation/controllers/gifs_controller.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/controllers/locations_controller.dart';
import 'presentation/pages/home_page.dart';
 
class HomeModule extends Module {
  @override 
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GifsController(i.get(),i.get())),
    Bind.lazySingleton((i) => CharactersController(i.get(),i.get())),
    Bind.lazySingleton((i) => LocationsController(i.get(),i.get())),
    Bind.lazySingleton((i) => EpisodeController(i.get(),i.get())),
    Bind.lazySingleton((i) => EpisodesController(i.get(),i.get())),
    Bind.lazySingleton((i) => HomeController(i.get())),
    Bind.lazySingleton((i) => GiphyRepository(i.get())),
    Bind.lazySingleton((i) => RickNMortyRepository(i.get()))
  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
   ChildRoute("/episode", child: (_, args) => EpisodePage(episode: args.data)),
 ];
}