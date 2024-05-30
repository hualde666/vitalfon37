import 'package:device_apps/device_apps.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher_string.dart';

abrirWhatsapp(String phone, String mensaje) async {
  // FlutterOpenWhatsapp.sendSingleMessage(phone, mensaje);
  var whatsappURl = "whatsapp://send?phone=" + phone + "";
  // var whatsappURl = "https://wa.me/phone?text=a";
  if (await canLaunchUrlString(whatsappURl)) {
    await launchUrlString(whatsappURl);
    // } else {
    //   throw 'Could not launch ';
    // }
  }
}

llamar(String telefono) async {
  if (telefono.isNotEmpty) {
    await FlutterPhoneDirectCaller.callNumber(telefono);
  }
  //String url = 'tel:' + telefono;

  // if (await canLaunch(url)) {
  //   await launch(url);
  //   // } else {
  //   //   throw 'Could not launch $url';
  //   // }
  // }
}

mensaje(String phone) async {
  if (phone == '') {
    Application? api = await DeviceApps.getApp('com.android.messaging', true);
    // await DeviceApps.getApp('com.google.android.apps.messaging', true);
    if (api == null) {
      // api = await DeviceApps.getApp('com.android.messaging', true);
      api = await DeviceApps.getApp('com.google.android.apps.messaging', true);
    }
    if (api != null) {
      api.openApp();
      return;
    }
  }
  String url = 'sms:' + phone;
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

abrirGoogle() async {
  // FlutterOpenWhatsapp.sendSingleMessage(phone, mensaje);

  if (await canLaunchUrlString('https://www.google.com')) {
    await launchUrlString('https://www.google.com');
    // } }
  }
}
