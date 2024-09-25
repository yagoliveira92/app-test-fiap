class CategoryModel {
  int? id;
  String? nome;
  String? imagem;

  CategoryModel({this.id, this.nome, this.imagem});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['imagem'] = imagem;
    return data;
  }
}
