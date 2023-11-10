

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_event.dart';

import '../../../../../injection_container.dart';
import '../../bloc/pokemon/remote/remote_pokemon_state.dart';

class PokemonDetailScreen extends StatelessWidget {
  final int id;
  const PokemonDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    BlocProvider<RemotePokemonBloc>(create: (context)=>sl()..add(GetPokemonDetail(id)),
    child: Scaffold(
      body:_buildBody()
    ));

  }


  _buildBody(){
    return BlocBuilder<RemotePokemonBloc,RemotePokemonState>(builder:(_,state){
      if(state is RemotePokemonLoading){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is RemotePokemonDetailsDone){
        return Container(
          child: Center(child: Text(state.pokemonData!.name)),
        );

      }
      return const SizedBox();

    } );
  }
}
