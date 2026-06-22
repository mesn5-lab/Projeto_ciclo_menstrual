import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/pages/lembretes_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerLembretes extends StatefulWidget {
  //informações que o card recebe de fora
  Lembretes lembretes; //objeto com seus dados
  final VoidCallback aoEditar; //VoidCallback não retorna nada é apenas um clique vazio
  final VoidCallback aoDeletar;

  //required define que são parâmetros obrigatórios
  ContainerLembretes({super.key, required this.lembretes, required this.aoEditar, required this.aoDeletar});

  @override
  State<ContainerLembretes> createState() => _ContainerLembretesState();
}

class _ContainerLembretesState extends State<ContainerLembretes> {
  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFD7BEED),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                //widget. permite que a classe de Estado acesse as variáveis que estão guardadas na classe principal, vai lá no objeto 'lembretes' e pega o valor contido em 'tipo_icone'
                widget.lembretes.tipo_icone,
                color: Color(0xFF9C27B0),
                size: 40,
              ),
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.lembretes.medicamento,
                    style: GoogleFonts.libreBaskerville(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),

                  Text(
                    'Dose: ${widget.lembretes.dose}', //opera a função dita anterior
                    style: GoogleFonts.libreBaskerville(fontSize: 12, color: Colors.black87),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Próxima: ${widget.lembretes.horario}',
                    style: GoogleFonts.libreBaskerville(fontSize: 12, color: Colors.black87),
                  ),
                  const SizedBox(height: 3),

                  Text(
                    'Motivo: ${widget.lembretes.motivo}',
                    style: GoogleFonts.libreBaskerville(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            Column(
              children: [
                //botão de editar: irá conectar a uma tela de edição futuramente
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white, size: 14),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.all(2),
                      onPressed: () {
                        debugPrint("Editar: ${widget.lembretes}");
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                //botão de deletar
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.white, size: 14),
                      constraints: const BoxConstraints(), //remove as restrições do tamanho do ícone
                      padding: EdgeInsets.all(2),
                      onPressed: widget.aoDeletar, //executa a ação presente na página principal
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}