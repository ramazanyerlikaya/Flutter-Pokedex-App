import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeBallImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeBallImageUrl,
            width: UIHelper.calculatePokeImageAndBallSize(),
            height: UIHelper.calculatePokeImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImageAndBallSize(),
              height: UIHelper.calculatePokeImageAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
