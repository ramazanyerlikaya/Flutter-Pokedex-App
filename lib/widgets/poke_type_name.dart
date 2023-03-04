import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.getPokemonPortraitNameTextStyle(),
                ),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.getPokemonPortraitNameTextStyle()
              ),
            ],
          ),
          SizedBox(height: 0.02.sh,),
          Chip(label: Text(pokemon.type?.join(',') ?? '' , style: Constants.getTypeChipTextStyle(),)),
        ],
      ),
    );
  }
}
