import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/infrastructure/models/rick_and_morty_characters_model.dart';

class RickAndMortyService {
  final _dio = Dio();

  Future<List<CharacterEntity>> getCharactersList() async {
    final response =
        await _dio.get('https://rickandmortyapi.com/api/character');
    final rickAndMortyCharactersModel =
        RickAndMortyCharacters.fromJson(response.data);
    return rickAndMortyCharactersModel.toCharactersEntity();
  }
}
