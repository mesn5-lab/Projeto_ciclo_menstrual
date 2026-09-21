import 'package:ciclo_menstrual/api/ciclo_api.dart';
import 'package:ciclo_menstrual/api/requisicao_api.dart';
import 'package:flutter/material.dart';
import  'package:google_fonts/google_fonts.dart';
import 'package:ciclo_menstrual/domain/ciclo.dart';
import 'package:ciclo_menstrual/db/ciclo_dao.dart';


class TelaRelatorio extends StatefulWidget {
  const TelaRelatorio({super.key});

  @override
  State<TelaRelatorio> createState() => _TelaRelatorioState();
}

class _TelaRelatorioState extends State<TelaRelatorio> {
  final CicloApi cicloApi = CicloApi();
  final RequisicaoApi requisicaoApi = RequisicaoApi();

  late Future<List<Ciclo>> futureListaCiclo;

  @override
  void initState() {
    super.initState();
    //futureListaCiclo = CicloDao().listar();
   futureListaCiclo = CicloApi().listar();

  }

  final CicloDao dao = CicloDao();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
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
                color: Colors.white.withValues(alpha: .85),
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
                          backgroundColor:
                          const Color(0xFF8E5CC8),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Gerando relatório em PDF...'),
                              backgroundColor: Color(0xFF7B3FB5),
                            ),
                          );
                        },
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

            Expanded(
              child: FutureBuilder<List<Ciclo>>(
                  future: futureListaCiclo,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Erro ao carregar dados: ${snapshot.error}',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("Nenhum ciclo cadastrado"),
                      );
                    }

                    final listaCiclos = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tendências Trimestrais',
                            style: GoogleFonts.libreBaskerville(
                              //fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7B3FB5),
                            ),
                          ),

                          const SizedBox(height: 15),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha:0.85),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                FutureBuilder<Ciclo>(
                                  future: requisicaoApi.foundChart(listaCiclos),
                                  builder: (context, snapshotCiclo) {
                                    if (snapshotCiclo.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox(
                                        height: 180,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                    if (snapshotCiclo.hasData &&
                                        snapshotCiclo.data!.url.isNotEmpty) {
                                      return Image.network(
                                        snapshotCiclo.data!.url,
                                        height: 200,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error,
                                            stackTrace) =>
                                        const Text(
                                            "Erro ao exibir imagem do gráfico"),
                                      );
                                    }
                                    return const Text(
                                        "Não foi possível carregar o gráfico");
                                  },
                                ),

                                const SizedBox(height: 10),
                                Container(
                                  height: 2,
                                  color: Colors.grey[300],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Sintomas mais frequentes:\n Cólica (10 dias)',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.libreBaskerville(
                                    color: const Color(0xFF7B3FB5),
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
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listaCiclos.length,
                            itemBuilder: (context, index) {
                              Ciclo ciclo = listaCiclos[index];

                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  title: Text(
                                    ciclo.sintoma,
                                    style: GoogleFonts.libreBaskerville(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(ciclo.dataInicio),
                                  trailing: Text(
                                    "${ciclo.duracao} dias",
                                    style: const TextStyle(
                                        color: Color(0xFF7B3FB5),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                 },
              ),
            ),
          ],
        ),
      ),
    );
  }
}