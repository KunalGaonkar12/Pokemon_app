import 'package:data/data.dart';
import 'package:flutter_recruitment_task/core/usecases/usecase.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/repository/pokemon_repository.dart';

class GetPokemonUsecase implements UseCase<List<PokemonModel>,void>{

  final PokemonRepository _pokemonRepository;

  GetPokemonUsecase(this._pokemonRepository);

  @override
  Future<List<PokemonModel>> call({void params}) {
   return _pokemonRepository.getPokemon();
  }

}