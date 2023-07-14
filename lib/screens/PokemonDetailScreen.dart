import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  final Color color;
  final pokemonDetail;
  final heroTag;

  const PokemonDetailScreen(
      {super.key,
      required this.color,
      required this.pokemonDetail,
      required this.heroTag});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
              top: 40,
              left: 2,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              )),
          Positioned(
              top: 90,
              left: 20,
              child: Text(
                widget.pokemonDetail['name'],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Positioned(
              top: 140,
              right: -50,
              child: Image.asset(
                'images/pokeball.png',
                width: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
              top: 130,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Text(
                    widget.pokemonDetail['type'].join(', '),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )),
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
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              widget.pokemonDetail['height'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['weight'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Spawn Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['spawn_time'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Weakness',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail['weaknesses'].join(', '),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.18,
              left: 150,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemonDetail['img'],
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              ))
        ],
      ),
    );
  }
}
