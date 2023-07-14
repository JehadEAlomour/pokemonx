import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:pokemonx/screens/PokemoCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemonList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            )),
        Positioned(
            left: 40,
            top: 10,
            child: Image.asset(
              'images/logo.png',
              width: 300,
              fit: BoxFit.fitWidth,
            )),
        const Positioned(
            top: 200,
            left: 20,
            child: Text(
              "PokemonX",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
        Positioned(
          top: 250,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokemonList != null
                  ? Expanded(
                      child: Container(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return PokemonCard(
                            pokemonList: pokemonList,
                            index: index,
                          );
                        },
                      ),
                    ))
                  : const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ]),
    ));
  }

  Future<void> fetchPokemonData() async {
    var uri = Uri.http("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    await http.get(uri).then((value) {
      if (value.statusCode == 200) {
        var decodeJsonData = jsonDecode(value.body);
        pokemonList = decodeJsonData['pokemon'];
        setState(() {});
      }
    }).catchError((e) {
      print(e);
    });
  }
}
