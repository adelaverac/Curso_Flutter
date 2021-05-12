import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:movies/src/models/movie_model.dart';

class PeliculasProvider {
  String _apiKey = '913ad29513057bd3f818da9bfb79e273';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = [];

  final _popularesStreamController = StreamController<
      List<
          Pelicula>>.broadcast(); // Broadcast para que pueda ser escuchado por muchos y no por 1

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    return await _getData('3/movie/now_playing', 1);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];

    _cargando = true;
    _popularesPage++;
    final response = await _getData('3/movie/popular', _popularesPage);
    _populares.addAll(response);
    popularesSink(_populares);
    _cargando = false;

    return response;
  }

  Future<List<Pelicula>> _getData(String endpoint, int page) async {
    final url = Uri.https(_url, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': page.toString()});

    final response = await http.get(url);
    final decodeData = json.decode(response.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }
}