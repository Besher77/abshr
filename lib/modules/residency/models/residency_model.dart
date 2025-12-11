/// Residency update model
/// Stores structure only - no business logic
class ResidencyModel {
  final String currentCity;
  final String district;
  final String workplace;
  final String country;
  final int residentsInsideKSA;
  final int residentsOutsideKSA;
  final double averageIncome;
  final int dependentsCount;
  final String educationLevel;
  final DateTime updatedAt;

  ResidencyModel({
    required this.currentCity,
    required this.district,
    required this.workplace,
    required this.country,
    required this.residentsInsideKSA,
    required this.residentsOutsideKSA,
    required this.averageIncome,
    required this.dependentsCount,
    required this.educationLevel,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentCity': currentCity,
      'district': district,
      'workplace': workplace,
      'country': country,
      'residentsInsideKSA': residentsInsideKSA,
      'residentsOutsideKSA': residentsOutsideKSA,
      'averageIncome': averageIncome,
      'dependentsCount': dependentsCount,
      'educationLevel': educationLevel,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ResidencyModel.fromJson(Map<String, dynamic> json) {
    return ResidencyModel(
      currentCity: json['currentCity'] ?? '',
      district: json['district'] ?? '',
      workplace: json['workplace'] ?? '',
      country: json['country'] ?? '',
      residentsInsideKSA: json['residentsInsideKSA'] ?? 0,
      residentsOutsideKSA: json['residentsOutsideKSA'] ?? 0,
      averageIncome: (json['averageIncome'] ?? 0.0).toDouble(),
      dependentsCount: json['dependentsCount'] ?? 0,
      educationLevel: json['educationLevel'] ?? '',
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

