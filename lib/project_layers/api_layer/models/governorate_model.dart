class Governorate {
  final String id;
  final String governorateNameAr;
  final String governorateNameEn;

  Governorate({
    required this.id,
    required this.governorateNameAr,
    required this.governorateNameEn,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['id'],
      governorateNameAr: json['governorate_name_ar'],
      governorateNameEn: json['governorate_name_en'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'governorate_name_ar': governorateNameAr,
      'governorate_name_en': governorateNameEn,
    };
  }
}