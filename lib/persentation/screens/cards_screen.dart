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

  @override
  void initState() {
    super.initState();
    // TODO: Implement provider to do the request
    _callCharacters();
  }

  _callCharacters() async {
    characters = await RickAndMortyService().getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return Text(characters[index].name);
      },
    );
  }
}
