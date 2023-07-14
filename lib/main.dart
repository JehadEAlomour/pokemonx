import 'package:flutter/material.dart';
import 'package:pokemonx/screens/HomeScreen.dart';

void main() {
  runApp(const PokemonMain());
}

class PokemonMain extends StatelessWidget {
  const PokemonMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }}
