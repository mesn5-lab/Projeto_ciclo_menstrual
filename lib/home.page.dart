import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

//estrutura padrão para iniciar a tela
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea( //usamos essa função para que o conteúdo não bata na câmera
        child: SingleChildScrollView( //função para a rolagem
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //espaço para não colar o conteúdo no topo do celular
              const SizedBox(height: 20),

              //o cartão branco
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35), //arrendondar as bordas
                  boxShadow: [
                    BoxShadow( //serve para dar a sensação que o círculo está flutuando
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _buildCicloCircular(),
                    const SizedBox(height: 35),
                    _buildGraficoHormonal(),
                    const SizedBox(height: 15),
                    Text(
                      "Níveis subindo: Prepare-se para a fase Lútea.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.purple[300],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              //é um sistema de organização que divide o espaço da tela em linhas e colunas
              _buildGridSintomas(),
              
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(173, 51, 193, 1.0),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      minimumSize: const Size(double.infinity,60),
                    ),
                    child:  Text(
                      "+Registrar Sintomas",
                      style: GoogleFonts.roboto(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
              ),
              ),
            ],
          ),
        ),
    );
  }

  //criar agora os widgets dos builds para que eles funcionem, obrigatório
  Widget _buildCicloCircular() {
    return SizedBox(
      width: 220,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: CircularProgressIndicator(
            value: 0.5,
            strokeWidth: 17,
            backgroundColor: Colors.pink[100],
            //essa função serve para manter uma cor fixa no progresso do círculo, e o que
            //está entre colchetes é o brilho da cor e a !, serve para afirmar que a cor existe
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[200]!),
          ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text("Dia", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16)),
               Text("18", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 48, fontWeight: FontWeight.bold, height: 1.1)),
               Text("31 mar", style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }

  //gráfico de ondas
  Widget _buildGraficoHormonal() {
    return SizedBox(
      height: 100,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
                spots:  [FlSpot(0, 1), FlSpot(1.5, 3), FlSpot(3, 1.5),],
                isCurved: true,
                barWidth: 4,
                color: Colors.purple[100],
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.purple[100]!.withOpacity(0.2)
                ),
                dotData: FlDotData(show: false),
            )
          ]
        )
      ),
    );
  }

  Widget _buildGridSintomas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _itemSintoma(Icons.water_drop, "Fluxo"),
        _itemSintoma(Icons.flash_on, "Cólica"),
        _itemSintoma(Icons.sentiment_dissatisfied, "Humor"),
        _itemSintoma(Icons.opacity, "Muco"),
      ],
    );
  }
  Widget _itemSintoma(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.purple[200], size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.roboto(color: Colors.purple[400], fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
  
}