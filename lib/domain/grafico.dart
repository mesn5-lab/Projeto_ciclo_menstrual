class Grafico {
  final String url;
  final String titulo;
  final int totalCiclos;

  Grafico({
    required this.url,
    required this.titulo,
    required this.totalCiclos,
});

  factory Grafico.fromJson(Map<String, dynamic> json) {
    return Grafico(
        url: json['url'] ?? '',
        titulo: json['titulo'] ?? '',
        totalCiclos: json['totalCiclos'] ?? 0,
    );
  }
}