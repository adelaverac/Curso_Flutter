import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Ninguna de estas propiedas se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // GET y SET del Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _prefs.setInt('genero', valor);
  }

  // GET y SET del colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool valor) {
    _prefs.setBool('colorSecundario', valor);
  }

  // GET y SET del Nombre
  get nombre {
    return _prefs.getString('nombre') ?? 'Andy';
  }

  set nombre(String valor) {
    _prefs.setString('nombre', valor);
  }

  // GET y SET de la ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String valor) {
    _prefs.setString('ultimaPagina', valor);
  }
}
