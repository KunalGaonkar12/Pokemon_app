import 'package:data/data.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository{
  final StubbedPokemonApi _stubbedPokemonApi;

  PokemonRepositoryImpl(this._stubbedPokemonApi);

  @override
  Future<List<PokemonModel>> getPokemon() async {
  var data = await _stubbedPokemonApi.pokemonList(page: 1);
  return data;
  }

  @override
  Future<PokemonModel> getPokemonDetail(int? id) async {
   var data =await _stubbedPokemonApi.pokemonDetail(id: id!);
    return data;
  }




}