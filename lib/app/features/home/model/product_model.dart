class ProductModel {
  int? id;
  int? categoriaId;
  String? nome;
  double? preco;
  String? imagem;

  ProductModel({this.id, this.categoriaId, this.nome, this.preco, this.imagem});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoriaId = json['categoriaId'];
    nome = json['nome'];
    preco = json['preço'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['categoriaId'] = categoriaId;
    data['nome'] = nome;
    data['preço'] = preco;
    data['imagem'] = imagem;
    return data;
  }
}
