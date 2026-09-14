/*class Horario {
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
}*/

class Horario {
  late String abreviacao;
  late String datetime;
  late int diaDaSemana;
  late int diaDoAno;
  late bool dst;
  late int dstOffset;
  late String fusoHorario;
  late int unixtime;
  late String utcDatetime;
  late String utcOffset;
  late int numeroDaSemana;

  // Propriedade utilitária para pegar apenas a hora formatada (ex: "14:30")
  String get hora {
    if (datetime.isEmpty) return '08:00';
    try {
      DateTime parsed = DateTime.parse(datetime);
      return "${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}";
    } catch (_) {
      return '08:00';
    }
  }

  Horario({
    required this.abreviacao,
    required this.datetime,
    required this.diaDaSemana,
    required this.diaDoAno,
    required this.dst,
    required this.dstOffset,
    required this.fusoHorario,
    required this.unixtime,
    required this.utcDatetime,
    required this.utcOffset,
    required this.numeroDaSemana,
  });

  // Construtor FROM JSON mapeando os nomes das chaves do mapa/imagem
  Horario.fromJson(Map<String, dynamic> json) {
    abreviacao = json['abreviação'] ?? '';
    datetime = json['datetime'] ?? '';
    diaDaSemana = json['dia_da_semana'] ?? 0;
    diaDoAno = json['dia_do_ano'] ?? 0;
    dst = json['dst'] ?? false;
    dstOffset = json['dst_offset'] ?? 0;
    fusoHorario = json['fuso horário'] ?? json['fuso_horario'] ?? '';
    unixtime = json['unixtime'] ?? 0;
    utcDatetime = json['utc_datetime'] ?? '';
    utcOffset = json['utc_offset'] ?? '';
    numeroDaSemana = json['número_da_semana'] ?? json['numero_da_semana'] ?? 0;
  }
}