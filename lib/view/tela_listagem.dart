import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'telacadastro.dart';

class ListViewProdutos extends StatefulWidget {
  @override
  _ListViewProdutosState createState() => _ListViewProdutosState();
}

class _ListViewProdutosState extends State<ListViewProdutos> {
  fetchProdutos() async {
    var url;
    url = await http
        .get(Uri.parse('https://teste-produtos.herokuapp.com/api/produtos'));
    return json.decode(url.body);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem Teste"),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.8,
            child: FutureBuilder(
              future: fetchProdutos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: size.width,
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${snapshot.data[index]['nome']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                                    child: Text(
                                      "ID do produto: ${snapshot.data[index]['id']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Quantidade: ${snapshot.data[index]['quantidade']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Valor: ${snapshot.data[index]['valor']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyApp()));
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
