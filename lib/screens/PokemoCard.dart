import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemonx/screens/PokemonDetailScreen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, this.pokemonList, this.index});

  final pokemonList;
  final index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO Navigation
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PokemonDetailScreen(
                    color: getColor(index),
                    pokemonDetail: pokemonList[index],
                    heroTag: index)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: getColor(index),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(children: [
              Positioned(
                bottom: -10,
                right: -10,
                child: Image.asset(
                  'images/pokeball.png',
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 15,
                left: 8,
                child: Text(pokemonList[index]['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Positioned(
                  top: 40,
                  left: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        pokemonList[index]['type'][0].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 2,
                right: 2,
                child: Hero(
                  tag: index,
                  child: CachedNetworkImage(
                    imageUrl: pokemonList[index]['img'],
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Color getColor(index) {
    return pokemonList[index]['type'][0] == "Grass"
        ? Colors.greenAccent
        : pokemonList[index]['type'][0] == "Fire"
            ? Colors.redAccent
            : pokemonList[index]['type'][0] == "Water"
                ? Colors.blue
                : pokemonList[index]['type'][0] == "Poison"
                    ? Colors.deepPurpleAccent
                    : pokemonList[index]['type'][0] == "Electric"
                        ? Colors.amber
                        : pokemonList[index]['type'][0] == "Rock"
                            ? Colors.grey
                            : pokemonList[index]['type'][0] == "Ground"
                                ? Colors.brown
                                : pokemonList[index]['type'][0] == "Psychic"
                                    ? Colors.indigo
                                    : pokemonList[index]['type'][0] ==
                                            "Fighting"
                                        ? Colors.orange
                                        : pokemonList[index]['type'][0] == "Bug"
                                            ? Colors.lightGreenAccent
                                            : pokemonList[index]['type'][0] ==
                                                    "Ghost"
                                                ? Colors.deepPurple
                                                : pokemonList[index]['type']
                                                            [0] ==
                                                        "Normal"
                                                    ? Colors.grey
                                                    : Colors.pink;
  }
}
