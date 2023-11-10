import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemotePokemonState extends Equatable{
  final List<PokemonModel> ?pokemon;
  final PokemonModel ?pokemonData;
  final DioException? error;
  const  RemotePokemonState({this.error,this.pokemon,this.pokemonData});

  @override
  List<Object> get props =>[pokemon!,error!,pokemonData!];

}

class RemotePokemonLoading extends RemotePokemonState{
  const RemotePokemonLoading();
}

class RemotePokemonDone extends RemotePokemonState{
  const RemotePokemonDone(List<PokemonModel> pokemon):super(pokemon: pokemon);
}

class RemotePokemonDetailsDone extends RemotePokemonState{
  const RemotePokemonDetailsDone(PokemonModel pokemonData):super(pokemonData: pokemonData);
}
class RemotePokemonError extends RemotePokemonState{
  const RemotePokemonError(DioException error):super(error: error);
}