import 'package:flutter/material.dart';

class TelaConfig extends StatefulWidget {
  const TelaConfig({super.key});

  @override
  State<TelaConfig> createState() => _TelaConfigState();
}

class _TelaConfigState extends State<TelaConfig> {
  bool notificacoes = true;
  bool modoEscuro = false;
  double tamanhoFonte = 16;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xFF8E5CC8),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Configurações",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B3FB5),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          children: [
                            itemSwitch(
                              icon: Icons.notifications_none,
                              titulo: "Notificações",
                              subtitulo:
                              "Receba lembretes e avisos importantes.",
                              valor: notificacoes,
                              onChanged: (v) {
                                setState(() {
                                  notificacoes = v;
                                });
                              },
                            ),

                            const SizedBox(height: 18),

                            itemSwitch(
                              icon: Icons.dark_mode_outlined,
                              titulo: "Modo Escuro",
                              subtitulo:
                              "Ative o tema escuro do aplicativo.",
                              valor: modoEscuro,
                              onChanged: (v) {
                                setState(() {
                                  modoEscuro = v;
                                });
                              },
                            ),

                            const SizedBox(height: 18),

                            itemFonte(),

                            const SizedBox(height: 18),

                            itemSobre(),

                            const SizedBox(height: 25),

                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xFF8E5CC8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Salvar",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

  Widget itemSwitch({
    required IconData icon,
    required String titulo,
    required String subtitulo,
    required bool valor,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF0E7F7),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              size: 30,
              color: const Color(0xFF8E5CC8),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitulo,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: valor,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF8E5CC8),
          ),
        ],
      ),
    );
  }

  Widget itemFonte() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.text_fields,
                size: 35,
                color: Color(0xFF8E5CC8),
              ),
              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  "Tamanho da Fonte",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Slider(
            value: tamanhoFonte,
            min: 12,
            max: 30,
            activeColor: const Color(0xFF8E5CC8),
            onChanged: (v) {
              setState(() {
                tamanhoFonte = v;
              });
            },
          ),

          Text(
            "Texto de Exemplo",
            style: TextStyle(fontSize: tamanhoFonte),
          ),
        ],
      ),
    );
  }

  Widget itemSobre() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.info_outline,
          color: Color(0xFF8E5CC8),
        ),
        title: const Text(
          "Sobre o App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text("Versão 1.0"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Sobre o App"),
              content: const Text(
                "Aplicativo de Saúde Feminina\nVersão 1.0",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Fechar"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}