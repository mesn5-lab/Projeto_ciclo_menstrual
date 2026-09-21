import 'package:intl/intl.dart';

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

  String get hora {
    if (datetime.isEmpty) return '08:00';
    try {
      // DateTime dateTime = inputFormat.parse(dateString);
      DateTime parsed = DateTime.parse(datetime).toUtc();

      // Subtrai manualmente as 3 horas do fuso da string original
      DateTime forcedOffset = parsed.subtract(Duration(hours: 3));

      // Formata para exibição final
      String formatted = DateFormat("HH:mm").format(forcedOffset);
      return formatted;
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

  Horario.fromJson(Map<String, dynamic> json) {
    abreviacao = json['abreviação'] ?? '';
    datetime = json['datetime'] ?? '';
    print('TESTE');
    print(json['datetime']);
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
