import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/domain/medicamento.dart';
import 'package:ciclo_menstrual/api/medicamento_api.dart';
import 'package:ciclo_menstrual/api/horario_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CriarLembretePage extends StatefulWidget {
  final Lembretes? editar_lembrete;

  const CriarLembretePage({super.key, this.editar_lembrete});

  @override
  State<CriarLembretePage> createState() => _CriarLembretePageState();
}

class _CriarLembretePageState extends State<CriarLembretePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();

  TimeOfDay _horario_escolhido = const TimeOfDay(hour: 8, minute: 0);

  @override
  void initState() {
    super.initState();
    _carregarEdicao();
  }

  void _carregarEdicao() {
    if(widget.editar_lembrete != null){
      _tituloController.text = widget.editar_lembrete!.medicamento;
      _doseController.text = widget.editar_lembrete!.dose;
      _motivoController.text = widget.editar_lembrete!.motivo;

      try{
        final partes = widget.editar_lembrete!.horario.split(':');
        if(partes.length == 2){
          _horario_escolhido = TimeOfDay(
              hour: int.parse(partes[0]),
              minute: int.parse(partes[1]),
          );
        }
      }catch(_) {}
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _doseController.dispose();
    _motivoController.dispose();
    super.dispose();
  }

  Future<void> _escolherHorario(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _horario_escolhido,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromRGBO(157, 88, 209, 1),
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      }
    );

    if(picked != null) {
      setState(() {
        _horario_escolhido = picked;
      });
    }
  }

  void _salvar() async {
    if(_formKey.currentState!.validate()) {
      final String horaFormatada = "${_horario_escolhido.hour.toString().padLeft(2, '0')}:${_horario_escolhido.minute.toString().padLeft(2, '0')}";

      Lembretes novo_lembrete = Lembretes(
        medicamento: _tituloController.text,
        dose: _doseController.text,
        horario: horaFormatada,
        tipo_icone: Icons.medication,
        motivo: _motivoController.text.isEmpty? 'Uso contínuo': _motivoController.text,
      );

      Medicamento medApi = Medicamento(
        nome: novo_lembrete.medicamento,
        dose: novo_lembrete.dose,
        tipo_icone: 'pilula',
        motivo: novo_lembrete.motivo,
      );
      await MedicamentoApi().salvar(medApi);

      Navigator.pop(context, novo_lembrete);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}