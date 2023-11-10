
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/features/pokemon/presentation/widgets/pokemon_type.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.70;
  static const double _pokemonFraction = 0.76;

  final PokemonModel pokemon;

  const PokemonCard(
      this.pokemon, {super.key,
        // this.onPress,
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.black,
              child: InkWell(
                // onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeball(height: itemHeight),
                    _buildPokemon(height: itemHeight),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokeball({required double height}) {
    final pokeballSize = height * _pokeballFraction;
    return Positioned(
      bottom: -height * 0.16,
      right: -height * 0.06,
      child: Image.asset(
      "assets/images/pokeball.png",
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * _pokemonFraction;
    print(pokemon.imageUrl);

    return Positioned(
      bottom: 9,
      right: 5,
      child: CachedNetworkImage(
          imageUrl: pokemon.imageUrl,
          imageBuilder : (context, imageProvider) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width/5,
                height: MediaQuery.of(context).size.width/5,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
          ),
          progressIndicatorBuilder : (context, url, downloadProgress) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                child: CupertinoActivityIndicator(),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                ),
              ),
            ),
          ),
          errorWidget : (context, url, error) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    child: Icon(Icons.error),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              )
      )
    );
  }

}

class _CardContent extends StatelessWidget {
  final PokemonModel pokemon;

  const _CardContent(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: pokemon.id.toString() + pokemon.name,
              child: Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 20,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ..._buildTypes(context)
            ,
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return pokemon.type
        .take(2)
        .map(
          (type) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: PokemonType(type),
      ),
    ).toList();
  }
}