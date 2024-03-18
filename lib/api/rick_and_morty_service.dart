import 'package:dio/dio.dart';

class RickAndMortyService {
  final _dio = Dio();

  Future<List<dynamic>> getCharactersList() async {
    final response =
        await _dio.get('https://rickandmortyapi.com/api/character');
    return [];
  }
}
