import 'dart:convert';
import 'package:apiwebmobile/model/model_produtos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tela_listagem.dart';

Future<ModelProdutos> createProdutos(
    String nome, String quantidade, String valor) async {
  final response = await http.post(
      Uri.https('teste-produtos.herokuapp.com', 'api/produtos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'quantidade': quantidade,
        'valor': valor
      }));
  if (response.statusCode == 201) {
    return ModelProdutos.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  Future<ModelProdutos> _futureProdutos;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Cadastrar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste API"),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                hintText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _quantidadeController,
              decoration: InputDecoration(
                hintText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(
                hintText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureProdutos = createProdutos(_nomeController.text,
                      _quantidadeController.text, _valorController.text);
                });
              },
              child: Text(
                "Cadastrar produto",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ListViewProdutos()));
              },
              label: const Text('Voltar para a lista'),
              icon: const Icon(Icons.arrow_back),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
