import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_event.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/pages/home/pokemon_home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/route.dart';
import 'generated/l10n.dart';
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePokemonBloc>(create: (context)=>sl()..add(const GetPokemon()),
        child:const MaterialApp(
      home:PokemonHomeScreen(),
          debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          supportedLocales: [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
          onGenerateRoute: AppRoutes.onGenerateRoutes,
    ));
  }
}
