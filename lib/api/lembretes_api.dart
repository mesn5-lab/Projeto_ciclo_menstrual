import 'package:ciclo_menstrual/api/horario_api.dart';
import 'package:ciclo_menstrual/api/medicamento_api.dart';
import 'package:ciclo_menstrual/domain/horario.dart';
import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/domain/medicamento.dart';

class LembreteService {
  final MedicamentoApi _medicamentoApi = MedicamentoApi();
  final HorarioApi _horarioApi = HorarioApi();

  /*Future<List<Lembretes>> obterLembretesCompletos() async {
    try {
      // 1. Busca os dados parciais da Fake API (nome, dose, tipo_icone, motivo)
      List<Medicamento> medicamentos = await _medicamentoApi.listarMedicamento();

      // 2. Busca os dados da API Externa de Horário
      List<Horario> horarios = await _horarioApi.findAll();

      // Define uma hora padrão caso a API externa não retorne horários
      String horaExterna = horarios.isNotEmpty ? horarios.first.hora : '08:00';

      List<Lembretes> listaLembretesCompletos = [];

      // 3. Mescla os parâmetros de ambas as APIs em um único objeto Lembretes
      for (var med in medicamentos) {
        listaLembretesCompletos.add(
          Lembretes(
            medicamento: med.nome,
            dose: med.dose,
            horario: horaExterna, // Injeta o horário vindo da API externa
            tipo_icone: Lembretes.getIcon(med.tipo_icone),
            motivo: med.motivo,
          ),
        );
      }

      return listaLembretesCompletos;
    } catch (e) {
      print('Erro ao fundir APIs: $e');
      return [];
    }
  }*/

  Future<List<Lembretes>> obterLembretesCompletos() async {
    List<Medicamento> medicamentos = [];
    List<Horario> horarios = [];

    try {
      medicamentos = await _medicamentoApi.listarMedicamento();
      print('Medicamentos carregados: ${medicamentos.length}');
    } catch (e) {
      print('ERRO na Fake API (Medicamentos): $e');
    }

    try {
      horarios = await _horarioApi.findAll();
      print('Horários carregados: ${horarios.length}');
    } catch (e) {
      print('ERRO na API de Horário: $e');
    }

    String horaExterna = horarios.isNotEmpty ? horarios.first.hora : '08:00';
    List<Lembretes> listaFinal = [];

    for (var med in medicamentos) {
      listaFinal.add(
        Lembretes(
          medicamento: med.nome,
          dose: med.dose,
          horario: horaExterna,
          tipo_icone: Lembretes.getIcon(med.tipo_icone),
          motivo: med.motivo,
        ),
      );
    }

    return listaFinal;
  }
}