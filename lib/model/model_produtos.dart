import 'dart:convert';

ModelProdutos modelProdutosFromJson(String str) =>
    ModelProdutos.fromJson(json.decode(str));

String modelProdutosToJson(ModelProdutos data) => json.encode(data.toJson());

class ModelProdutos {
  ModelProdutos({
    this.id,
    this.nome,
    this.quantidade,
    this.valor,
  });

  int id;
  String nome;
  int quantidade;
  int valor;

  factory ModelProdutos.fromJson(Map<String, dynamic> json) => ModelProdutos(
        id: json["id"],
        nome: json["nome"],
        quantidade: json["quantidade"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "quantidade": quantidade,
        "valor": valor,
      };
}
