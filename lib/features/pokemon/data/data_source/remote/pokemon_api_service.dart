//
// import 'package:retrofit/http.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/dio.dart';
// import '../../../../../core/constants/constaints.dart';
// import '../../models/pokemon.dart';
// part 'pokemon_api_service.g.dart';
//
//
// @RestApi(baseUrl:pokemonAPIBaseURL)
// abstract class PokemonApiService{
//
//   factory PokemonApiService(Dio dio)=_PokemonApiService;
//
//   @GET('/pokemons.json')
//   Future<HttpResponse<List<Pokemon>>> getPokemons();
//
// }