import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/widgets/poke_information.dart';
import 'package:flutter_pokedex/widgets/poke_type_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/pokemon_model.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeBallImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeBallImageUrl)
        : _buildLandScapeBody(context, pokeBallImageUrl);
  }

  Scaffold _buildLandScapeBody(BuildContext context, String pokeBallImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: IconButton(
                iconSize: 20.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.26.sw,
                            fit: BoxFit.fitHeight,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: UIHelper.getDefaultPadding(), 
                    child: PokeInformation(pokemon: pokemon),
                  ))
              ],
            ),
          )
        ]),
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeBallImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: IconButton(
                iconSize: 30.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeNameType(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  pokeBallImageUrl,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: PokeInformation(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    )),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
