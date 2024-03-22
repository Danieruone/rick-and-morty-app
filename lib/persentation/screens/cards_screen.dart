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
        : ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Text(characters[index].name);
            },
          );
  }
}
