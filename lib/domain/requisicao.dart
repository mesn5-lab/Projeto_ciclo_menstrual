class Requisicao {
  final String url;
  final String titulo;
  final int totalCiclos;

  Requisicao({
    required this.url,
    required this.titulo,
    required this.totalCiclos,
});

  factory Requisicao.fromJson(Map<String, dynamic> json) {
    return Requisicao(
        url: json['url'] ?? '',
        titulo: json['titulo'] ?? '',
        totalCiclos: json['totalCiclos'] ?? 0,
    );
  }
}