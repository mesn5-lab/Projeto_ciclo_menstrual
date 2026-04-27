import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  int mes = 4;
  int ano = 2026;

  final Set<int> diasSelecionados = {};

  final List<String> nomesMeses = [
    '',
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  void _proximomes() {
    setState(() {
      if (mes == 12) {
        mes = 1;
        ano++;
      } else {
        mes++;
      }
      diasSelecionados.clear();
    });
  }

  void _mesanterior() {
    setState(() {
      if (mes == 1) {
        mes = 12;
        ano--;
      } else {
        mes--;
      }
      diasSelecionados.clear();
    });
  }

  int _diasNoMes(int m, int a) {
    return DateTime(a, m + 1, 0).day;
  }

  int _primeiroDiaSemana(int m, int a) {
    return DateTime(a, m, 1).weekday % 7;
  }

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
                child: IgnorePointer(
              child: Image.asset(
                'assets/images/topo.png',
                fit: BoxFit.cover,
              ),
            ),
           ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
              child: Image.asset(
                'assets/images/rodape.png',
                fit: BoxFit.cover,
              ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                     Text(
                      'Calendário',
                      style: GoogleFonts.roboto(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF4A148C),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            nomesMeses[mes],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF6A0DAD),
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 12),

                          _cabecalhoDias(),

                          const SizedBox(height: 8),

                          _gradeDias(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    _botaonavegacao(
                      '<<< Mês Anterior',
                      _mesanterior,
                    ),

                    const SizedBox(height: 12),

                    _botaonavegacao(
                      'Mês Posterior >>>',
                      _proximomes,
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

  Widget _cabecalhoDias() {
    const dias = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF6A0DAD),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: dias.map((d) {
          return Text(
            d,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradeDias() {
    int totalDias = _diasNoMes(mes, ano);
    int inicio = _primeiroDiaSemana(mes, ano);

    List<int?> celulas = [
      ...List.filled(inicio, null),
      ...List.generate(totalDias, (i) => i + 1),
    ];

    while (celulas.length % 7 != 0) {
      celulas.add(null);
    }

    return Column(
      children: List.generate(celulas.length ~/ 7, (linha) {
        final semana = celulas.skip(linha * 7).take(7).toList();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: semana.map((dia) {
            if (dia == null) {
              return const SizedBox(width: 36, height: 36);
            }

            bool marcado = diasSelecionados.contains(dia);

            return GestureDetector(
              onTap: () {
                setState(() {
                  if (marcado) {
                    diasSelecionados.remove(dia);
                  } else {
                    diasSelecionados.add(dia);
                  }
                });
              },
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: marcado
                      ? const Color(0xFF6A0DAD)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  dia.toString().padLeft(2, '0'),
                  style: TextStyle(
                    color: marcado
                        ? Colors.white
                        : const Color(0xFF4A148C),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }

  Widget _botaonavegacao(String texto, VoidCallback acao) {
    return ElevatedButton(
      onPressed: acao,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF6A0DAD),
        minimumSize: const Size(double.infinity, 50),
        shape: const StadiumBorder(),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}