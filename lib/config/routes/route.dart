import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/detalscreen/pokem_detail.dart';

import '../../features/pokemon/presentation/pages/home/pokemon_home.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(PokemonHomeScreen());

        case '/PokemonDetails':
          final args = settings.arguments as int;
        return _materialRoute(PokemonDetailScreen(id: args,));

      default:
        return _materialRoute( PokemonHomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}