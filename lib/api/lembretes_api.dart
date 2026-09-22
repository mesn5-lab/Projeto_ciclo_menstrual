import 'package:ciclo_menstrual/api/horario_api.dart';
import 'package:ciclo_menstrual/api/medicamento_api.dart';
import 'package:ciclo_menstrual/domain/horario.dart';
import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/domain/medicamento.dart';

class LembreteService {
  final MedicamentoApi _medicamentoApi = MedicamentoApi();
  final HorarioApi _horarioApi = HorarioApi();

  Future<List<Lembretes>> obterLembretesCompletos() async {
    List<Medicamento> medicamentos = [];
    Horario? horarios;

    try {
      medicamentos = await _medicamentoApi.listarMedicamento();
      print('Medicamentos carregados: ${medicamentos.length}');
    } catch (e) {
      print('ERRO na Fake API (Medicamentos): $e');
    }

    try {
      horarios = await _horarioApi.findAll();
      print('Horários carregados');
    } catch (e) {
      print('ERRO na API de Horário: $e');
    }

    String horaExterna =  horarios!.hora ?? '08:00';
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
