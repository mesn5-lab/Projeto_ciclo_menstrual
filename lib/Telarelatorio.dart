import 'package:flutter/material.dart';
import  'package:google_fonts/google_fonts.dart';


class TelaRelatorio extends StatelessWidget {
  const TelaRelatorio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              color: const Color(0xFFD8B4E2),
            ),


            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/topo.png',
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/topo.png',
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                       Text(
                      "Seu Ciclo em Dados",
                      style: GoogleFonts.roboto(
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
                            style: GoogleFonts.racingSansOne(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7B3FB5),
                            ),
                          ),

                          const SizedBox(height: 10),

                           Text(
                            "Gere um PDF detalhado dos últimos 6 meses para levar ao seu médico.",
                            style: GoogleFonts.sansitaSwashed(
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
                                  backgroundColor:
                                  const Color(0xFF8E5CC8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Gerar Relatório PDF",
                                  style: GoogleFonts.arbutus(
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
                      style: GoogleFonts.roboto(
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
                            style: GoogleFonts.abel(
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

                          Container(
                            height: 2,
                            color: Colors.grey[300],
                          ),

                          const SizedBox(height: 10),

                          Text(
                            'Sintomas mais frequente:\n Cólica (10 dias)',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.aBeeZee(
                              color: Color(0xFF7B3FB5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.calendar_today, color: Colors.purple),
                          Icon(Icons.menu_book, color: Colors.purple),
                          Icon(Icons.favorite, color: Colors.purple),
                          Icon(Icons.bar_chart, color: Colors.purple),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget barra(double altura){
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