import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instancia = new SharedPref._internal();
  factory SharedPref() {
    return _instancia;
  }
  SharedPref._internal() {
    // init();
  }
  static late SharedPreferences _pref;
  static bool _iGoogle = true;
  static bool _iContactos = true;
  static bool _iAplicaciones = true;
  static bool _iTelefono = true;
  static bool _iBateria = false;
  static bool _iWifi = false;
  static bool _iLinea = false;
  static bool _iGps = false;
  static bool _iLinterna = true;
  static bool _iReloj = true;
  static bool _iMensaje = true;
  static bool _menuHorizontal = true;
  static String _paleta = "2";
  static String _telefonoEmergencia = "";
  static bool _instalado = false;
  static bool _modoConfig = true;
  //static Color _backgroundColor = Color.fromARGB(255, 117, 149, 133);

  init() async {
    WidgetsFlutterBinding.ensureInitialized();

    _pref = await SharedPreferences.getInstance();
    // print('abriendo shared pref en el provider:  $_instalado');

    if (!_iLinterna && !_iMensaje && !_iReloj && !_iTelefono) {
      _menuHorizontal = false;
    } else {
      _menuHorizontal = true;
    }
  }

  inicializar() {
    iGoogle = true;

    iContactos = true;
    iAplicaciones = true;
    iTelefono = true;
    iBateria = false;
    iWifi = false;
    iLinea = false;
    iGps = false;
    iLinterna = true;
    iReloj = true;
    iMensaje = true;
    _menuHorizontal = true;
    paleta = "2";
    telefonoEmergencia = "";

    ///instalado = false;
    _modoConfig = true;
    //_backgroundColor = Color.fromARGB(255, 117, 149, 133);

    //notifyListeners();
  }

  bool get modoConfig {
    if (_pref.getBool('modoconfig') == null) {
      _modoConfig = true;
    } else {
      _modoConfig = _pref.getBool('modoconfig')!;
    }
    return _modoConfig;
  }

  set modoConfig(bool modo) {
    _modoConfig = modo;
    _pref.setBool('modoconfig', modo);
    // notifyListeners();
  }

  String get paleta {
    _paleta = _pref.getString('paleta') ?? '2';

    return _paleta;
  }

  // Color get backgroundColor {
  //   return _backgroundColor;
  // }

  String get telefonoEmergencia {
    return _pref.getString('telefonoEmergencia') ?? _telefonoEmergencia;
  }

  bool get instalado {
    _instalado = _pref.getBool('instalado') ?? false;

    return _instalado;
  }

  set instalado(bool estatus) {
    _instalado = estatus;
    _pref.setBool('instalado', estatus);
  }

  set paleta(String nuevaPaleta) {
    _paleta = nuevaPaleta;

    _pref.setString('paleta', nuevaPaleta);
    // cambioBackground();
    // notifyListeners();
  }

  set telefonoEmergencia(String nuevoTelefono) {
    _telefonoEmergencia = nuevoTelefono;

    _pref.setString('telefonoEmergencia', nuevoTelefono);
    //notifyListeners();
  }

  set iGoogle(bool estatus) {
    _iGoogle = estatus;
    _pref.setBool('google', estatus);

    // notifyListeners();
  }

  bool get iGoogle {
    return _pref.getBool('google') ?? _iGoogle;
  }

  bool get iLinterna {
    return _pref.getBool('linterna') ?? _iLinterna;
  }

  set iContactos(bool estatus) {
    _iContactos = estatus;
    _pref.setBool('contactos', estatus);

    // notifyListeners();
  }

  bool get iContactos {
    return _pref.getBool('contactos') ?? _iContactos;
  }

  set iAplicaciones(bool estatus) {
    _iAplicaciones = estatus;
    _pref.setBool('aplicaciones', estatus);

    //notifyListeners();
  }

  bool get iAplicaciones {
    return _pref.getBool('aplicaciones') ?? _iAplicaciones;
  }

  set iTelefono(bool estatus) {
    _iTelefono = estatus;
    _pref.setBool('telefono', estatus);

    //notifyListeners();
  }

  set iBateria(bool estatus) {
    _iBateria = estatus;
    _pref.setBool('bateria', estatus);

    // notifyListeners();
  }

  set iWifi(bool estatus) {
    _iWifi = estatus;
    _pref.setBool('wifi', estatus);

    // notifyListeners();
  }

  set iLinea(bool estatus) {
    _iLinea = estatus;
    _pref.setBool('linea', estatus);

    // notifyListeners();
  }

  set iGps(bool estatus) {
    _iGps = estatus;
    _pref.setBool('gps', estatus);

    // notifyListeners();
  }

  set iLinterna(bool estatus) {
    _iLinterna = estatus;
    _pref.setBool('linterna', estatus);

    //notifyListeners();
  }

  set iReloj(bool estatus) {
    _iReloj = estatus;
    _pref.setBool('reloj', estatus);

    //notifyListeners();
  }

  set iMensaje(bool estatus) {
    _iMensaje = estatus;
    _pref.setBool('mensaje', estatus);

    // notifyListeners();
  }

  eliminarLLamadaEmergencia() {
    _pref.remove(telefonoEmergencia);
    _telefonoEmergencia = '';
  }

  bool get iTelefono {
    return _pref.getBool('telefono') ?? _iTelefono;
  }

  bool get iBateria {
    return _pref.getBool('bateria') ?? _iBateria;
  }

  bool get iWifi {
    return _pref.getBool('wifi') ?? _iWifi;
  }

  bool get iLinea {
    return _pref.getBool('linea') ?? _iLinea;
  }

  bool get iGps {
    return _pref.getBool('gps') ?? _iGps;
  }

  bool get iReloj {
    return _pref.getBool('reloj') ?? _iReloj;
  }

  bool get iMensaje {
    return _pref.getBool('mensaje') ?? _iMensaje;
  }

  get menuHorizontal {
    return _menuHorizontal;
  }
}
