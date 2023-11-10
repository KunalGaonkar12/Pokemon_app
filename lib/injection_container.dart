import 'package:data/data.dart';
import 'package:flutter_recruitment_task/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/usecases/get_pokemon.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

Future<void>  initializeDependencies() async{

  sl.registerSingleton<StubbedPokemonApi>(StubbedPokemonApi());

  sl.registerSingleton<PokemonRepository>(PokemonRepositoryImpl(sl()));

  sl.registerSingleton<GetPokemonUsecase>(GetPokemonUsecase(sl()));
  sl.registerSingleton<GetPokemonDetailUsecase>(GetPokemonDetailUsecase(sl()));

sl.registerFactory<RemotePokemonBloc>(() => RemotePokemonBloc(sl(),sl()));
}