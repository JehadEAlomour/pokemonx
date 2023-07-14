import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final List pokemonItem;
  final int index;
  const PokemonCard(this.pokemonItem,this.index ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        pokemonItem[index]['name'].toString()
      ),
    );
  }
}
