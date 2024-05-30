package com.piproy.vitalfon

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugins.GeneratedPluginRegistrant




import android.content.Context

import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
//import android.telephony.SmsManager
import android.Manifest
//import android.content.pm.PermissionGroupInfo
import android.content.pm.PackageManager
import android.net.ConnectivityManager
import android.net.ConnectivityManager.NetworkCallback
import android.net.NetworkCapabilities
import android.location.LocationManager
import android.hardware.camera2.CameraManager
//import 	android.net.wifi.WifiNetworkSuggestion
//import android.net.wifi.WifiManager
//import android.net.Uri
import    android.telephony.TelephonyManager
//import    android.telephony.SmsManager.FinancialSmsCallback
import android.app.Activity
import com.google.android.gms.location.*
import androidx.core.content.ContextCompat
import androidx.core.app.ActivityCompat

class MainActivity : FlutterActivity() {
    private val CHANNEL = "app.piproy.channel/hualdemirene@gmail.com"

    // private val REQUEST_PERMISSION_PHONE_STATE = 1
    // val resultado: Boolean = verificarPermisos()
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //val resultado: Boolean = verificarPermisos()
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            // Note: this method is invoked on the main thread.
            // TODO
            if (call.method == "permisos") {

                var resultado1 = verificarPermisos()
                result.success(resultado1)
            } else
                if (call.method == "linterna") {
                    val prender: Boolean = (call.argument("prender") as? Boolean) ?: false
                    var resultado2 = prendeLinterna(prender)
                    result.success(resultado2)
                } else

                    if (call.method == "bateria") {

                        val batteryLevel = getNivelBateria()

                        if (batteryLevel != -1) {

                            result.success(batteryLevel)
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null)
                            println("error en bateria")
                        }
                    } else {


                        var respuesta = metodo(call.method)
                        result.success(respuesta)


                    }

        }
    }

    private fun metodo(proceso: String): Boolean {


        when (proceso) {
            "permisos" -> {
                return verificarPermisos()
            }
            "permisocall" -> {
                return permisoCall()
            }
            "permisogeo" -> {
                return permisoGeo()
            }
            "permisosms" -> {
                return permisoSms()
            }
            "tengopermisosms" -> {
                return tengoPermisoSms()
            }
            //   "version" -> {return verificarPermisos()}
            "wifion" -> {
                return getWifiOn()
            }

            "wifioncon" -> {
                return getWifiOnCon()
            }
//                "linterna" -> {
//                    return prendeLinterna(prender)
//                }
            "gps" -> {
                return getGps()
            }
            "datos" -> {
                return getDatos()
            }


            "cargando" -> {
                return getCargaBateria()
            }
            else -> {
                return false
            }
        }
    }


    private fun verificarPermisos(): Boolean {
        println("************entreeeeee en permisos")

        return true
    }

    private fun getAndroidVersion(): String {
        val sdkVersion: Int
        val release: String
        val respuesta: String
        sdkVersion = VERSION.SDK_INT
        release = VERSION.RELEASE
        respuesta = "Android version: " + sdkVersion + "release: " + release
        return respuesta

    }

    private fun getNivelBateria(): Int {

        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel =
                batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            batteryLevel =
                intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                    BatteryManager.EXTRA_SCALE,
                    -1
                )

        }

        return batteryLevel
    }

    private fun getCargaBateria(): Boolean {

        val batteryStatus: Intent? =
            IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { ifilter ->
                context.registerReceiver(null, ifilter)
            }
        val status: Int = batteryStatus?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
        val isCharging: Boolean = status == BatteryManager.BATTERY_STATUS_CHARGING
                || status == BatteryManager.BATTERY_STATUS_FULL



        return isCharging
    }

    private fun getLocalizacion(): Boolean {
        // val locationRequest = LocationRequest.create().apply {
        //     interval = 10000
        //     fastestInterval = 5000
        //     priority = LocationRequest.PRIORITY_HIGH_ACCURACY
        // }
        // lateinit var fusedLocationClient: FusedLocationProviderClient
//             fusedLocationClient.requestLocationUpdates(
//     locationRequest,

// )

        return true
    }

    private fun getWifiOn(): Boolean {


        val connectivityManager =
            getSystemService(android.content.Context.CONNECTIVITY_SERVICE)
                    as ConnectivityManager

        if (VERSION.SDK_INT >= VERSION_CODES.M) {
            val networkCapabilities = connectivityManager.activeNetwork ?: return false
            val activeNetwork =
                connectivityManager.getNetworkCapabilities(networkCapabilities) ?: return false

            return when {

                // activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) ||
                //  activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) ||
                activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> true

                else -> false
            }
        } else {
            return false
        }
    }

    private fun getWifiOnCon(): Boolean {
/// esta fun es para ver si hay conexion wifi con señal

        val connectivityManager =
            getSystemService(android.content.Context.CONNECTIVITY_SERVICE)
                    as ConnectivityManager

        if (VERSION.SDK_INT >= VERSION_CODES.M) {
            val networkCapabilities = connectivityManager.activeNetwork ?: return false
            val activeNetwork =
                connectivityManager.getNetworkCapabilities(networkCapabilities) ?: return false

            return when {

                // activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) ||
                //  activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) ||
                activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> true

                else -> false
            }
        } else {
            return false
        }
    }


    // determina si GPS esta on o off
    private fun getGps(): Boolean {
        var locationManager =
            context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        if (locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {

            return true
        }
        return false

    }


    private fun getDatos(): Boolean {
        var tm =
            context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager;  //gets the current TelephonyManager
        return !(tm.getSimState() == TelephonyManager.SIM_STATE_ABSENT);

        // return true

    }

    private fun prendeLinterna(prender: Boolean): Boolean {

        //  val prender: Boolean = (call.argument("prender") as? Boolean) ?: false
        var camManager: CameraManager =
            getSystemService(Context.CAMERA_SERVICE) as CameraManager;
        var cameraId: String =
            camManager.getCameraIdList()[0]; // usualmente la camara delantera esta en la posicion 0
        camManager.setTorchMode(cameraId, prender);

        return true

    }


    private fun permisoCall(): Boolean {

        ActivityCompat.requestPermissions(
            this, arrayOf(Manifest.permission.CALL_PHONE),
            101
        )
        return true


    }

    private fun tengoPermisoSms(): Boolean {
        var permiso = ContextCompat.checkSelfPermission(
            this,
            Manifest.permission.SEND_SMS
        );
        println("******************");
        if (permiso != PackageManager.PERMISSION_GRANTED) {

                println("error NO HAY PERMISOS");
                return false;
            }
            println("con permisos   de una");
            return true;


    }

    private fun permisoSms(): Boolean {
        var permiso: Boolean;
        if (ActivityCompat.shouldShowRequestPermissionRationale(this,
        Manifest.permission.SEND_SMS)){
                permiso = false;
        }else{
            ActivityCompat.requestPermissions(this@MainActivity,  arrayOf(Manifest.permission.SEND_SMS),200 );
             permiso = tengoPermisoSms();

        }
        
         

        return permiso;
    }



        




    private fun permisoGeo(): Boolean {

        ActivityCompat.requestPermissions(
            this, arrayOf(Manifest.permission.ACCESS_COARSE_LOCATION),
            101
        )
        return true


    }
}