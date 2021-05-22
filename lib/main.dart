import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_firebase1/crudFirabase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //========================================================================================
  //INICIANDO O FIREBASE:
  //ref: https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //========================================================================================

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final CrudFirebase crudF = CrudFirebase();
  String idColecao = '';

  void _incrementCounter() {
    setState(() {
      //ESTUDO CRUD FIREBASE
      crudF.addColectionFirbaseTeste();
      idColecao = crudF.idColection;
      crudF.updateColectionFirbaseTeste();
      crudF.getColectionFirbaseTeste();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ID da coleção geradada no firebase: $idColecao',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
