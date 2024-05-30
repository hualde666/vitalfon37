import 'dart:async';
import 'package:flutter/services.dart';

class AndroidChannel {
  static final AndroidChannel _canal = AndroidChannel._internal();

  factory AndroidChannel() {
    return _canal;
  }
  late MethodChannel _methodChannel;

  AndroidChannel._internal() {
    _methodChannel = MethodChannel("app.piproy.channel/hualdemirene@gmail.com");
  }

  Future<void> pedirVersion() async {
    try {
      await _methodChannel.invokeMethod("version");
      //print('Respuesta : $result');
    } catch (e) {
      // print('ERROR: $e');
    }
  }

  // Future<void> listaApis() async {
  //   print('Entre a listaApis');
  //   try {
  //     final result = await _methodChannel.invokeMethod("aplicaciones");
  //     print('Respuesta : $result');
  //     return result;
  //   } catch (e) {
  //     print('ERROR: $e');
  //   }
  // }

  Future<int> nivelBateria() async {
    try {
      final result = await _methodChannel.invokeMethod("bateria");

      return result;
    } catch (e) {
      // print('ERROR: $e');
      return 0;
    }
  }

  Future<bool> cargandoBateria() async {
    try {
      final result = await _methodChannel.invokeMethod("cargando");

      return result;
    } catch (e) {
      // print('ERROR: $e');
      return false;
    }
  }

  Future<bool> conectadoWifi() async {
    try {
      final result = await _methodChannel.invokeMethod("wifion");

      return result;
    } catch (e) {
      //print('ERROR: $e');
      return false;
    }
  }

  Future<bool> conectadoWifiCon() async {
    try {
      final result = await _methodChannel.invokeMethod("wifioncon");

      return result;
    } catch (e) {
      //print('ERROR: $e');
      return false;
    }
  }
  //
  // Future<bool> swichWifi(bool on) async {
  //   try {
  //     final result = await _methodChannel.invokeMethod("onoffwifi");
  //
  //     return result;
  //   } catch (e) {
  //     //print('ERROR: $e');
  //     return false;
  //   }
  // }
  //
  // Future<bool> swichGps(bool on) async {
  //   try {
  //     final result = await _methodChannel.invokeMethod("onoffgps");
  //
  //     return result;
  //   } catch (e) {
  //     // print('ERROR: $e');
  //     return false;
  //   }
  // }

  Future<bool> conectadoGps() async {
    try {
      final result = await _methodChannel.invokeMethod("gps");

      return result;
    } catch (e) {
      // print('ERROR: $e');
      return false;
    }
  }

  Future<bool> conectadoDatos() async {
    try {
      final result = await _methodChannel.invokeMethod("datos");

      return result;
    } catch (e) {
      // print('ERROR: $e');
      return false;
    }
  }

  Future<bool> onoffLinterna(bool prender) async {
    try {
      var parametros = {'prender': prender};
      final result = await _methodChannel.invokeMethod("linterna", parametros);

      return result;
    } catch (e) {
      //print('ERROR: $e');
      return false;
    }
  }

  Future<void> mandarSms(String phone, String mensaje) async {
    try {
      var parametros = {'phone': phone, 'mensaje': mensaje};

      await _methodChannel.invokeMethod("mandarsms", parametros);

      return;
    } catch (e) {
      // return e;
    }
  }

  Future<void> permisoCall() async {
    try {
      await _methodChannel.invokeMethod("permisocall", '');
    } catch (e) {
      // return e;
    }
  }

  Future<void> permisoGeo() async {
    try {
      await _methodChannel.invokeMethod("permisogeo", '');
    } catch (e) {
      // return e;
    }
  }

  Future<bool> permisoSms() async {
    // pido permiso SMS
    final bool autorizado = await _methodChannel.invokeMethod("permisosms", '');

    return autorizado;


  }
  Future<bool> tengoPermisoSms() async {
    // verifico si tengo permiso
    final bool autorizado = await _methodChannel.invokeMethod("tengopermisosms", '');
    print('tengo permiso?======: $autorizado');
    return autorizado;


  }
}
