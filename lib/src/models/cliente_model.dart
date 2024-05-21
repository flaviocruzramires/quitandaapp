class ClienteModel {
  ClienteModel({
    required this.nome,
    required this.celular,
    required this.endereco,
    required this.bairro,
    required this.cidade,
    required this.estado,
    this.cep,
    this.cpf,
  });

  String nome;
  String celular;
  String endereco;
  String bairro;
  String cidade;
  String estado;
  String? cep;
  String? cpf;
}
