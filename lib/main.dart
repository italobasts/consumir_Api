import 'package:apiwebmobile/view/tela_listagem.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste API',
      home: ListViewProdutos(),
    );
  }
}
