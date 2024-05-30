import 'package:flutter/material.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';

class Preferencias extends ChangeNotifier {
  static final Preferencias _instancia = new Preferencias._internal();
  factory Preferencias() {
    return _instancia;
  }
  Preferencias._internal() {
    init();
  }

  static bool _iGoogle = SharedPref().iGoogle;
  static bool _iContactos = SharedPref().iContactos;
  static bool _iAplicaciones = SharedPref().iAplicaciones;
  static bool _iTelefono = SharedPref().iTelefono;
  static bool _iBateria = SharedPref().iBateria;
  static bool _iWifi = SharedPref().iWifi;
  static bool _iLinea = SharedPref().iLinea;
  static bool _iGps = SharedPref().iGps;
  static bool _iLinterna = SharedPref().iLinterna;
  static bool _iReloj = SharedPref().iReloj;
  static bool _iMensaje = SharedPref().iMensaje;
  static bool _menuHorizontal = SharedPref().menuHorizontal;
  static String _paleta = SharedPref().paleta;
  static String _telefonoEmergencia = SharedPref().telefonoEmergencia;
  //static bool _instalado = SharedPref().instalado;
  static bool _modoConfig = SharedPref().modoConfig;
  static Color _backgroundColor = Color.fromARGB(255, 117, 149, 133);

  init() {
    cambioBackground();
    if (!_iLinterna && !_iMensaje && !_iReloj && !_iTelefono) {
      _menuHorizontal = false;
    } else {
      _menuHorizontal = true;
    }

    notifyListeners();
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
    modoConfig = true;
    _backgroundColor = Color.fromARGB(255, 117, 149, 133);

    notifyListeners();
  }

  bool get modoConfig {
    return _modoConfig;
  }

  set modoConfig(bool modo) {
    _modoConfig = modo;

    notifyListeners();
  }

  String get paleta {
    if (_paleta == '') {
      _paleta = '2';
    }
    cambioBackground();

    return _paleta;
  }

  Color get backgroundColor {
    return _backgroundColor;
  }

  String get telefonoEmergencia {
    return _telefonoEmergencia;
  }

  set paleta(String nuevaPaleta) {
    _paleta = nuevaPaleta;

    cambioBackground();
    notifyListeners();
  }

  void cambioBackground() {
    switch (_paleta) {
      case '1':
        _backgroundColor = Color.fromARGB(255, 3, 51, 90);
        break;
      case '2':
        _backgroundColor = Color.fromARGB(
            255, 117, 149, 133); //Color.fromARGB(255, 143, 185, 168);
        break;
      case '3':
        _backgroundColor = Color.fromARGB(255, 7, 98, 89);
        break;
      case '4':
        _backgroundColor = Colors.black;
        break;
      case '5':
        _backgroundColor = Colors.white;
        break;
    }
  }

  set telefonoEmergencia(String nuevoTelefono) {
    _telefonoEmergencia = nuevoTelefono;

    notifyListeners();
  }

  set iGoogle(bool estatus) {
    _iGoogle = estatus;

    notifyListeners();
  }

  bool get iGoogle {
    return _iGoogle;
  }

  set iContactos(bool estatus) {
    _iContactos = estatus;

    notifyListeners();
  }

  bool get iContactos {
    return _iContactos;
  }

  set iAplicaciones(bool estatus) {
    _iAplicaciones = estatus;

    notifyListeners();
  }

  bool get iAplicaciones {
    return _iAplicaciones;
  }

  set iTelefono(bool estatus) {
    _iTelefono = estatus;

    onoffMenuHorizontal(estatus);
    notifyListeners();
  }

  set iBateria(bool estatus) {
    _iBateria = estatus;

    onoffMenuHorizontal(estatus);
    notifyListeners();
  }

  set iWifi(bool estatus) {
    _iWifi = estatus;

    onoffMenuHorizontal(estatus);
    notifyListeners();
  }

  set iLinea(bool estatus) {
    _iLinea = estatus;

    onoffMenuHorizontal(estatus);
    notifyListeners();
  }

  set iGps(bool estatus) {
    _iGps = estatus;

    onoffMenuHorizontal(estatus);

    notifyListeners();
  }

  set iLinterna(bool estatus) {
    _iLinterna = estatus;

    onoffMenuHorizontal(estatus);

    notifyListeners();
  }

  set iReloj(bool estatus) {
    _iReloj = estatus;

    onoffMenuHorizontal(estatus);
    notifyListeners();
  }

  set iMensaje(bool estatus) {
    _iMensaje = estatus;

    onoffMenuHorizontal(estatus);

    notifyListeners();
  }

  onoffMenuHorizontal(bool estatus) {
    if (estatus = true) {
      _menuHorizontal = true;
    }
    if (!_iLinterna && !_iMensaje && !_iReloj && !_iTelefono) {
      _menuHorizontal = false;
    }
    notifyListeners();
  }

  eliminarLLamadaEmergencia() {
    _telefonoEmergencia = '';
  }

  bool get iTelefono {
    return _iTelefono;
  }

  bool get iBateria {
    return _iBateria;
  }

  bool get iWifi {
    return _iWifi;
  }

  bool get iLinea {
    return _iLinea;
  }

  bool get iGps {
    return _iGps;
  }

  bool get iLinterna {
    return _iLinterna;
  }

  bool get iReloj {
    return _iReloj;
  }

  bool get iMensaje {
    return _iMensaje;
  }

  get menuHorizontal {
    return _menuHorizontal;
  }
}
