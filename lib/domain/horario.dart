class Horario {
  late String id;
  late String hora;
  late String periodo;
  late bool disponivel;

  Horario({
    required this.id,
    required this.hora,
    required this.periodo,
    required this.disponivel,
  });

  Horario.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    hora = json['hora'];
    periodo = json['periodo'];
    disponivel = json['disponivel'] ?? true;
  }
}