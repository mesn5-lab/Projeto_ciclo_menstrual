import 'package:ciclo_menstrual/domain/lembretes.dart';
import 'package:ciclo_menstrual/pages/lembretes_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerLembretes extends StatefulWidget {
  Lembretes lembretes;
  final VoidCallback aoEditar;
  final VoidCallback aoDeletar;

  ContainerLembretes({super.key, required this.lembretes, required this.aoEditar, required this.aoDeletar});

  @override
  State<ContainerLembretes> createState() => _ContainerLembretesState();
}

class _ContainerLembretesState extends State<ContainerLembretes> {
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LembretesPage(lembretes: widget.lembretes);
            }
          ),
        );*/
      },

      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFD7BEED),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.lembretes.tipo_icone,
                color: Color(0xFF9C27B0),
                size: 26,
              ),
            ),
            const SizedBox(width: 15),

            Expanded(
              child: Column(
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
                    'Dose: ${widget.lembretes.dose}',
                    style: GoogleFonts.libreBaskerville(fontSize: 12, color: Colors.black87),
                  ),
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

            Row(
              children: [
                //botão de editar
                Container(
                  width: 20,
                  height: 20,
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
                const SizedBox(width: 8),

                //botão de deletar
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.white, size: 14),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.all(2),
                      onPressed: widget.aoDeletar,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}