class Ciclo {

  int? id; //? -> significa que ela pode ser nula pq é gerado automaticamente pelo BD
  String data;
  String sintoma;
  int duracao;

  //construtor
  Ciclo({
    this.id,
    //informações obrigatórias:
    required this.data,
    required this.sintoma,
    required this.duracao,
});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'data':data,
      'sintoma':sintoma,
      'duracao':duracao,
    };
  }
  factory Ciclo.fromMap(Map<String, dynamic> map){
    return Ciclo(
    id: map['id'],
    data: map['data'],
    sintoma: map['sintoma'],
    duracao: map['duracao'],
    );
  }

}