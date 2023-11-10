import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_bloc.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/bloc/pokemon/remote/remote_pokemon_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../generated/l10n.dart';
import '../../widgets/pokemon_card.dart';

class PokemonHomeScreen extends StatelessWidget {
  const PokemonHomeScreen({Key? key}) : super(key: key);

  void _onPress(PokemonModel pokemon,BuildContext context) {
Navigator.pushNamed(context, "/PokemonDetails");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
body: _buildBody(context),
      backgroundColor: Colors.black.withOpacity(0.5),
    );
  }

  _buildBody(BuildContext context){
    return BlocBuilder<RemotePokemonBloc,RemotePokemonState>(builder:(_,state){
      if(state is RemotePokemonLoading){
        return  Skeletonizer(enabled: true,child:ListView.builder(itemBuilder: (context,index){
          return Container();
        },itemCount: 10),);
      }
      if(state is RemotePokemonDone){

        return _buildGrid(context ,state);

      }
      return const SizedBox();

    } );
  }

  _buildAppBar(BuildContext context){
    return AppBar(
      title: Text(S.of(context).Pokemon),centerTitle: true,
      leading:Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset("assets/images/pokeball.png",color: Colors.white.withOpacity(0.5),),
      ),
      leadingWidth: MediaQuery.of(context).size.width/8,

      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white.withOpacity(0.5),size:MediaQuery.of(context).size.height/19,))
      ],
      backgroundColor: Colors.black,
      elevation: 0.5,
      toolbarHeight: 90,
    );
  }

  Widget _buildGrid(BuildContext context,RemotePokemonState state) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      PokemonModel pokemon=state.pokemon![index];
                    return  GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/PokemonDetails",arguments: pokemon.id);
                      },
                       child: PokemonCard(
                          pokemon
                        )
                    ) ;
                    },
                childCount:state.pokemon!.length,
              ),
          ),
        ),
      ],
    );
  }
}
