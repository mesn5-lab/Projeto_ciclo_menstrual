import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/domain/ciclo.dart';
import 'package:ciclo_menstrual/db/ciclo_dao.dart';

class TelaRelatorio extends StatelessWidget {
  const TelaRelatorio({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ciclo> ciclos = [
      Ciclo(data: "18/06/2026", sintoma: "Cólica", duracao: 5),
      Ciclo(data: "25/06/2026", sintoma: "Fadiga", duracao: 3),
      Ciclo(data: "30/06/2026", sintoma: "Dor de cabeça", duracao: 2),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              Text(
                "Seu Ciclo em Dados",
                style: GoogleFonts.libreBaskerville(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B3FB5),
                ),
              ),

              const SizedBox(height: 20),

              // CARD RELATÓRIO
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Relatório para consulta Médica",
                      style: GoogleFonts.libreBaskerville(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B3FB5),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Gere um PDF detalhado dos últimos 6 meses para levar ao seu médico.",
                      style: GoogleFonts.libreBaskerville(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: SizedBox(
                        width: 220,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8E5CC8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Gerar Relatório PDF",
                            style: GoogleFonts.libreBaskerville(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Text(
                'Tendências Trimestrais',
                style: GoogleFonts.libreBaskerville(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B3FB5),
                ),
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Text(
                      "Duração Média: 28 dias",
                      style: GoogleFonts.libreBaskerville(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B3FB5),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        barra(40),
                        barra(70),
                        barra(35),
                        barra(60),
                        barra(30),
                        barra(50),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Container(height: 2, color: Colors.grey[300]),

                    const SizedBox(height: 10),

                    Text(
                      'Sintomas mais frequente:\n Cólica (10 dias)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.libreBaskerville(
                        color: Color(0xFF7B3FB5),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Histórico de Ciclos",
                style: GoogleFonts.libreBaskerville(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF7B3FB5),
                ),
              ),

              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ciclos.length,
                itemBuilder: (context, index) {
                  Ciclo ciclo = ciclos[index];

                  return Card(
                    child: ListTile(
                      title: Text(ciclo.sintoma),
                      subtitle: Text(ciclo.data),
                      trailing: Text("${ciclo.duracao} dias"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget barra(double altura) {
    return Container(
      width: 12,
      height: altura,
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
