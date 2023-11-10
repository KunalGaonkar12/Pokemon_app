import 'package:data/data.dart';

import '../../../../core/usecases/usecase.dart';
import '../repository/pokemon_repository.dart';

class GetPokemonDetailUsecase implements UseCase<PokemonModel,int>{

  final PokemonRepository _pokemonRepository;

  GetPokemonDetailUsecase(this._pokemonRepository);

  @override
  Future<PokemonModel> call({int? params}) {
    return _pokemonRepository.getPokemonDetail(params);
  }



}