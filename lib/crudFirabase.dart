import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//========================================================================================
// Estudo firebase:
//========================================================================================

class CrudFirebase {
  String idColection;

  static inicializeFirabase() async {
    //INICIANDO O FIREBASE:
    //ref: https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
