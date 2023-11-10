
import 'package:data/data.dart';

abstract class PokemonRepository{

 Future<List<PokemonModel>> getPokemon();

 Future<PokemonModel> getPokemonDetail(int? data);
}