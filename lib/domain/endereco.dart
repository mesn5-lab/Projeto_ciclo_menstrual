class Endereco {
  late String cep;
  late String logradouro;
  late String bairro;
  late String localidade;
  late String uf;

  Endereco.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
  }
}