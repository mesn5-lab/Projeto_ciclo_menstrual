class Ciclo {

  int? id; //? -> significa que ela pode ser nula pq é gerado automaticamente pelo BD
  String dataInicio;
  String sintoma;
  int duracao;
  String obs;
  String url;

  //construtor
  Ciclo({
    this.id,
    //informações obrigatórias:
    required this.dataInicio,
    required this.sintoma,
    required this.duracao,
    required this.obs,
    this.url = '',
});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'data':dataInicio,
      'sintoma':sintoma,
      'duracao':duracao,
      'url': url,
    };
  }
  factory Ciclo.fromMap(Map<String, dynamic> map){
    return Ciclo(
    id: map['id'] is int
        ? map['id']
        : int.tryParse(map['id']?.toString() ?? ''),
    dataInicio: map['data'] ?? '',
    sintoma: map['sintoma'] ?? '',
    duracao: map['duracao'] is int
        ? map['id']
        : int.tryParse(map['id']?.toString() ?? '') ?? 0,
    obs: map['obs'] ?? '',
    url: map['url'] ?? '',
    );
  }

  factory Ciclo.fromJson(Map<String, dynamic> json){
    return Ciclo(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? ''),
      dataInicio: json['dataInicio'] ?? json['data'] ?? '',
      sintoma: json['sintoma'] ?? '',
      duracao: json['duracao'] ?? '' is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? '') ?? 0,
      obs: json['obs'] ?? '',
      url: json['url'] ?? '',
    );
  }

}