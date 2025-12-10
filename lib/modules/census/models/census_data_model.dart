/// Census data model
/// Stores structure only - no business logic
class CensusDataModel {
  final int totalPopulation;
  final int citizens;
  final int expats;
  final Map<String, int> cityDistribution;
  final Map<String, int> districtDistribution;
  final Map<String, int> ageGroups;
  final Map<String, int> genderDistribution;
  final Map<String, int> nationalityDistribution;
  final List<Map<String, dynamic>> forecasts;
  final List<Map<String, dynamic>> serviceUsage;
  final DateTime lastUpdated;

  CensusDataModel({
    required this.totalPopulation,
    required this.citizens,
    required this.expats,
    required this.cityDistribution,
    required this.districtDistribution,
    required this.ageGroups,
    required this.genderDistribution,
    required this.nationalityDistribution,
    required this.forecasts,
    required this.serviceUsage,
    required this.lastUpdated,
  });

  Map<String, dynamic> toJson() {
    return {
      'totalPopulation': totalPopulation,
      'citizens': citizens,
      'expats': expats,
      'cityDistribution': cityDistribution,
      'districtDistribution': districtDistribution,
      'ageGroups': ageGroups,
      'genderDistribution': genderDistribution,
      'nationalityDistribution': nationalityDistribution,
      'forecasts': forecasts,
      'serviceUsage': serviceUsage,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  factory CensusDataModel.fromJson(Map<String, dynamic> json) {
    return CensusDataModel(
      totalPopulation: json['totalPopulation'] ?? 0,
      citizens: json['citizens'] ?? 0,
      expats: json['expats'] ?? 0,
      cityDistribution: Map<String, int>.from(json['cityDistribution'] ?? {}),
      districtDistribution: Map<String, int>.from(json['districtDistribution'] ?? {}),
      ageGroups: Map<String, int>.from(json['ageGroups'] ?? {}),
      genderDistribution: Map<String, int>.from(json['genderDistribution'] ?? {}),
      nationalityDistribution: Map<String, int>.from(json['nationalityDistribution'] ?? {}),
      forecasts: List<Map<String, dynamic>>.from(json['forecasts'] ?? []),
      serviceUsage: List<Map<String, dynamic>>.from(json['serviceUsage'] ?? []),
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }
}

