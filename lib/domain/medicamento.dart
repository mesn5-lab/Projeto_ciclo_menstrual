class Medicamento {
  final String? nomeFabricante;
  final String? unii;
  final String? tipoDeProduto;
  final String? splSetId;
  final String? rota;
  final String? nomeGenerico;
  final String? nomeDaMarca;
  final String? produtoNdc;
  final String? nomeDaSubstancia;
  final String? classeFarmaceutica;
  final String? formaDeDosagem;
  final String? eEmbaladorOriginal;
  final String? originalPackagerProduct;
  final String? upc;

  Medicamento({
    this.nomeFabricante,
    this.unii,
    this.tipoDeProduto,
    this.splSetId,
    this.rota,
    this.nomeGenerico,
    this.nomeDaMarca,
    this.produtoNdc,
    this.nomeDaSubstancia,
    this.classeFarmaceutica,
    this.formaDeDosagem,
    this.eEmbaladorOriginal,
    this.originalPackagerProduct,
    this.upc,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      nomeFabricante: json['nome_do_fabricante'] ?? '',
      unii: json['unii'] ?? '',
      tipoDeProduto: json['tipo_de_produto'] ?? '',
      splSetId: json['spl_set_id'] ?? '',
      rota: json['rota'] ?? '',
      nomeGenerico: json['nome_genérico'] ?? json['nome_generico'] ?? '',
      nomeDaMarca: json['nome_da_marca'] ?? '',
      produtoNdc: json['produto_ndc'] ?? '',
      nomeDaSubstancia: json['nome_da_substância'] ?? json['nome_da_substancia'] ?? '',
      classeFarmaceutica: json['classe_farmacêutica'] ?? json['classe_farmaceutica'] ?? '',
      formaDeDosagem: json['forma_de_dosagem'] ?? '',
      eEmbaladorOriginal: json['é_embalador_original'] ?? json['e_embalador_original'] ?? '',
      originalPackagerProduct: json['original_packager_product'] ?? '',
      upc: json['upc'] ?? '',
    );
  }
}