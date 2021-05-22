import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//========================================================================================
// Estudo firebase:
//========================================================================================
//referencia : https://petercoding.com/firebase/2020/04/04/using-cloud-firestore-in-flutter/

class CrudFirebase {
  String idColection;

  static inicializeFirabase() async {
    //INICIANDO O FIREBASE:
    //ref: https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> addColectionFirbaseTeste() async {
    //obtem uma instancia do firebase:
    final firestoreInstance = FirebaseFirestore.instance;
    //Cria a coleção
    firestoreInstance.collection("users").add({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((value) {
      print("ADD - success! " + value.id);
      //pego o id da coleção:
      idColection = value.id;
    });
  }

  Future<void> updateColectionFirbaseTeste() async {
    //obtem uma instancia do firebase:
    final firestoreInstance = FirebaseFirestore.instance;

    //id que ser quer alterar:
    final String idDocument = 'SbxHgPKlxnrjwpjmlqFR';

    firestoreInstance
        .collection("users")
        .doc(
          idDocument,
        )
        .update({
      "name": "Andre",
      "email": "ALSUPDATE@example.com",
      "age": 555,
      "address": {
        "street": "Av. Parigot",
        "city": "Toledo",
      },
    }).then((_) {
      print("UPDATE - success!");
    });
  }

  Future<void> getColectionFirbaseTeste() async {
    //obtem uma instancia do firebase:
    final firestoreInstance = FirebaseFirestore.instance;
    //Faz uma consulta:
    firestoreInstance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
      });

      print("GET - success!");
    });
  }
}
