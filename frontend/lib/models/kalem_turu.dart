class KalemTuru {
  final int kalemTuruId;
  final String kalemTuruAdi;

  KalemTuru({required this.kalemTuruId, required this.kalemTuruAdi});

  factory KalemTuru.fromJson(Map<String, dynamic> json) {
    return KalemTuru(
      kalemTuruId: json['kalem_turu_id'],
      kalemTuruAdi: json['kalem_turu_adi'],
    );
  }
}
