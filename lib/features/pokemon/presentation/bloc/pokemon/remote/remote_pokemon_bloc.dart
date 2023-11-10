
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/usecases/get_pokemon.dart';
import 'package:flutter_recruitment_task/features/pokemon/domain/usecases/get_pokemon_details.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_event.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_state.dart';

class RemotePokemonBloc extends Bloc<RemotePokemonEvent,RemotePokemonState>{
  final GetPokemonUsecase _getPokemonUsecase;
  final GetPokemonDetailUsecase _getPokemonDetailUsecase;

  RemotePokemonBloc(this._getPokemonUsecase, this._getPokemonDetailUsecase):super(const  RemotePokemonLoading()){
    on<GetPokemon> (onGetPokemon);
    on<GetPokemonDetail> (onGetPokemonDetails);
  }

  Future<void>  onGetPokemon(GetPokemon event,Emitter<RemotePokemonState> emit) async{
    final data= await _getPokemonUsecase();
    if(data.isEmpty||data==null){
      emit(RemotePokemonLoading());
    }else{
      emit(RemotePokemonDone(data));
    }
  }

  Future<void>  onGetPokemonDetails(GetPokemonDetail event,Emitter<RemotePokemonState> emit) async{
    if(event is GetPokemonDetail){
      final int id = event.data;
      final data= await _getPokemonDetailUsecase(params: id);
      if(data==null){
        emit(RemotePokemonLoading());
      }else{
        emit(RemotePokemonDetailsDone(data));
      }
    }

  }
}