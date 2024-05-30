import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:piproy/scr/models/contactos_modelo.dart';

class ContactosProvider with ChangeNotifier {
  static ContactosProvider _contactosProvider = ContactosProvider._internal();

  factory ContactosProvider() {
    return _contactosProvider;
  }
  ContactosProvider._internal() {
//_listaContactos = [];

    // getcontactos();
    // notifyListeners();
  }
  List<Contact> _listaContactos = [];
  late final ContactoDatos _contacto;
  ContactoDatos get contacto {
    return _contacto;
  }

  set contacto(ContactoDatos nuevoContacto) {
    _contacto = nuevoContacto;

    notifyListeners();
  }

  get listaContactos async {
    if (_listaContactos == []) {
      getcontactos();
    }
    return _listaContactos;
  }

  Future<ContactoDatos> obtenerContacto(String nombre) async {
    String _nombre = '';
    String _telefono = "";
    String _whatsapp = "";
    final resp = await Permission.contacts.request();
    if (resp == PermissionStatus.granted) {
      Iterable<Contact> listaContacto =
          await ContactsService.getContacts(query: nombre);
      Contact contact =
          listaContacto.firstWhere((element) => element.displayName == nombre);
      _nombre = contact.displayName ?? '';

      if (contact.phones!.isNotEmpty) {
        _telefono = contact.phones!.elementAt(0).value ?? '';
        // Item item = contact.phones.firstWhere(
        //     (element) => element.value.substring(0, 1) == '+',
        //     orElse: () => null);
        // if (item != null) {
        //   _whatsapp = item.value;
        // }
      }
      final _contacto = new ContactoDatos(
          _nombre, _telefono, _whatsapp, contact.avatar, contact.initials());

      return _contacto;
    } else {
      return new ContactoDatos(_nombre, _telefono, _whatsapp, null, '');
    }
  }

  borrarDeListaContacto(ContactoDatos contacto) {
    _listaContactos.remove(contacto);
  }

// elimina id de la lista de id conctactos

  Future<List<Contact>> getcontactos() async {
    // List<Contact> _lista = [];

    final resp = await Permission.contacts.request();

    if (resp == PermissionStatus.granted) {
      List<Contact> _contactos = (await ContactsService.getContacts()).toList();
      _listaContactos = [];
      _listaContactos
          .addAll(_contactos.where((contac) => contac.phones != []).toList());

      return _listaContactos;
    }
    return [];
  }
}
