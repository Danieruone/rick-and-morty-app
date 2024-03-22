import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/api/rick_and_morty_service.dart';
import 'package:rick_and_morty_app/domain/entities/character_entity.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  List<CharacterEntity> characters = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _callCharacters();
  }

  _callCharacters() async {
    loading = true;
    var response = await RickAndMortyService().getCharactersList();
    setState(() {
      characters = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Text("Loading...")
        : Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 300,
                              width: 300,
                              child: Image.network(character.image)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            character.name,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                );
              },
            ),
          );
  }
}
