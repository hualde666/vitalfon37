import 'package:flutter/material.dart';
import 'package:piproy/channel/channel_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EstadoProvider with ChangeNotifier {
  static final EstadoProvider _estadosProvider = EstadoProvider._internal();

  factory EstadoProvider() {
    return _estadosProvider;
  }
  EstadoProvider._internal() {
    cargarPrefPaleta();
    actulizarDatos();
    return;
  }
  AndroidChannel _androidChannel = AndroidChannel();
  Color? _bateriaColor = Colors.green[900];
  Color? _colorWifi = Colors.red[900];
  //**************************** Actividad dispositivos************ */
  int _nivelBateria = 100;
  bool _cargandoBateria = false;
  bool _conexionWifi = false;
  bool _conexionDatos = false;
  bool _conexionGps = false;
  bool _linterna = false;
  //*************************** Flag de iconos horzontales activos */
  bool _iGoogle = true;
  bool _iContactos = true;
  bool _iAplicaciones = false;
  bool _iTelefono = false;
  bool _iBateria = false;
  bool _iWifi = false;
  bool _iLinea = false;
  bool _iGps = false;
  bool _iLinterna = false;
  bool _iReloj = false;
  bool _iMensaje = false;
  bool _menuHorizontal = false;
  //*************************** Opcines del detalle menu principal*/
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

  //*************************** Color de la aplicacion ********** */
  String _paleta = "1";

  String get paleta {
    return _paleta;
  }

  set paleta(String nuevaPaleta) {
    _paleta = nuevaPaleta;
    notifyListeners();
  }

  //************************** set y get  de iconos horizontales */
  set iTelefono(bool estatus) {
    _iTelefono = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iBateria(bool estatus) {
    _iBateria = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iWifi(bool estatus) {
    _iWifi = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iLinea(bool estatus) {
    _iLinea = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iGps(bool estatus) {
    _iGps = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iLinterna(bool estatus) {
    _iLinterna = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }
    notifyListeners();
  }

  set iReloj(bool estatus) {
    _iReloj = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }

    notifyListeners();
  }

  set iMensaje(bool estatus) {
    _iMensaje = estatus;
    if (estatus = true) {
      _menuHorizontal = true;
    } else {
      onoffMenuHorizontal();
    }

    notifyListeners();
  }

  onoffMenuHorizontal() {
    if (!_iBateria &&
        !_iGps &&
        !_iLinea &&
        !_iLinterna &&
        !_iMensaje &&
        !_iReloj &&
        !_iWifi) {
      _menuHorizontal = false;
    }
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

  bool get menuHorizontal {
    return _menuHorizontal;
  }

  get linterna {
    return _linterna;
  }

  set swichLinterna(bool onoff) {
    _linterna = onoff;
    notifyListeners();
  }

  set swichWifi(bool onoff) {
    _conexionWifi = onoff;
    notifyListeners();
  }

  get nivelBateria {
    return _nivelBateria;
  }

  get bateriaColor {
    return _bateriaColor;
  }

  get wifiColor {
    return _colorWifi;
  }

  get cargandoBateria {
    return _cargandoBateria;
  }

  get conexionWifi {
    return _conexionWifi;
  }

  get conexionDatos {
    return _conexionDatos;
  }

  get conexionGps {
    return _conexionGps;
  }

  cargarPrefPaleta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _paleta = prefs.getString('paleta') ?? '2';
  }

  actulizarDatos() async {
    final bateria = await _androidChannel.nivelBateria();
    final _cargando = await _androidChannel.cargandoBateria();
    final _wifi = await _androidChannel.conectadoWifi();
    // final _wifiConInternet = await _androidChannel.conectadoWifiCon();
    final _gps = await _androidChannel.conectadoGps();
    final _datos = await _androidChannel.conectadoDatos();
    if (bateria != _nivelBateria) {
      _nivelBateria = bateria;
      if (!_cargando) {
        if (bateria > 50) {
          _bateriaColor = Color.fromARGB(255, 39, 138, 46); //Colors.green[900];
        } else {
          if (bateria > 20) {
            _bateriaColor = Colors.yellow[900];
          } else {
            _bateriaColor = Colors.red[900];
          }
        }
      } else {
        _bateriaColor = Color.fromARGB(255, 4, 49, 117);
      }

      notifyListeners();
    }
    if (_cargandoBateria != _cargando) {
      _cargandoBateria = _cargando;
      notifyListeners();
    }
    if (_conexionWifi != _wifi) {
      _conexionWifi = _wifi;
      if (_wifi) {
        _colorWifi = Colors.green[900];
      } else {
        _colorWifi = Colors.red[900];
      }
      notifyListeners();
    }
    if (_conexionGps != _gps) {
      _conexionGps = _gps;
      notifyListeners();
    }
    if (_conexionDatos != _datos) {
      _conexionDatos = _datos;
      notifyListeners();
    }
  }
}
