/// Mock census data for Smart Census Hub
/// All mocked census data should be defined here
class CensusMockData {
  CensusMockData._();

  // Total population
  static const int totalPopulation = 35000000;
  static const int citizens = 21000000;
  static const int expats = 14000000;

  // City distribution (using keys for localization)
  static final Map<String, int> cityDistribution = {
    'riyadh': 8500000,
    'jeddah': 4700000,
    'mecca': 2400000,
    'medina': 1500000,
    'dammam': 1200000,
    'khobar': 800000,
    'taif': 1400000,
    'abha': 700000,
    'tabuk': 600000,
    'other': 12000000,
  };

  // District distribution (top districts - using keys for localization)
  static final Map<String, int> districtDistribution = {
    'al_malaz': 450000,
    'al_olaya': 380000,
    'al_naseem': 320000,
    'al_wurud': 280000,
    'al_faisaliah': 250000,
    'al_balad': 420000,
    'al_hamra': 350000,
    'al_rawdah': 310000,
    'al_corniche_dammam': 290000,
    'al_aziziyah_dammam': 270000,
    'other': 30000000,
  };

  // Age groups
  static final Map<String, int> ageGroups = {
    '0-14': 8500000,
    '15-24': 7000000,
    '25-34': 8000000,
    '35-44': 6000000,
    '45-54': 3500000,
    '55-64': 2000000,
    '65+': 1000000,
  };

  // Gender distribution
  static final Map<String, int> genderDistribution = {
    'Male': 19000000,
    'Female': 16000000,
  };

  // Nationality distribution (top nationalities)
  static final Map<String, int> nationalityDistribution = {
    'Saudi': 21000000,
    'Indian': 2500000,
    'Pakistani': 2200000,
    'Filipino': 1800000,
    'Bangladeshi': 1500000,
    'Egyptian': 1200000,
    'Nepali': 800000,
    'Sri Lankan': 600000,
    'Other': 4000000,
  };

  // AI Forecasts (3, 6, 12 months)
  static final List<Map<String, dynamic>> forecasts = [
    {
      'period': '3_months',
      'totalPopulation': 35200000,
      'citizens': 21120000,
      'expats': 14080000,
      'growthRate': 0.57,
      'prediction': 'forecast_3_months',
    },
    {
      'period': '6_months',
      'totalPopulation': 35450000,
      'citizens': 21270000,
      'expats': 14180000,
      'growthRate': 1.29,
      'prediction': 'forecast_6_months',
    },
    {
      'period': '12_months',
      'totalPopulation': 35900000,
      'citizens': 21540000,
      'expats': 14360000,
      'growthRate': 2.57,
      'prediction': 'forecast_12_months',
    },
  ];

  // Service usage analytics
  static final List<Map<String, dynamic>> serviceUsage = [
    {
      'service': 'residency_renewal',
      'nameKey': 'service_residency_renewal',
      'usageCount': 1250000,
      'peakTime': '09:00-11:00',
      'avgProcessingTime': '15 minutes',
      'bottleneck': false,
    },
    {
      'service': 'id_renewal',
      'nameKey': 'service_id_renewal',
      'usageCount': 980000,
      'peakTime': '10:00-12:00',
      'avgProcessingTime': '12 minutes',
      'bottleneck': false,
    },
    {
      'service': 'driving_license',
      'nameKey': 'service_driving_license',
      'usageCount': 750000,
      'peakTime': '08:00-10:00',
      'avgProcessingTime': '20 minutes',
      'bottleneck': true,
    },
    {
      'service': 'birth_registration',
      'nameKey': 'service_birth_registration',
      'usageCount': 650000,
      'peakTime': '14:00-16:00',
      'avgProcessingTime': '10 minutes',
      'bottleneck': false,
    },
    {
      'service': 'family_registration',
      'nameKey': 'service_family_registration',
      'usageCount': 520000,
      'peakTime': '11:00-13:00',
      'avgProcessingTime': '18 minutes',
      'bottleneck': false,
    },
    {
      'service': 'address_update',
      'nameKey': 'service_address_update',
      'usageCount': 480000,
      'peakTime': '15:00-17:00',
      'avgProcessingTime': '8 minutes',
      'bottleneck': false,
    },
  ];

  // Heatmap data for census (more detailed - using keys for localization)
  static final List<Map<String, dynamic>> censusHeatmapData = [
    // Riyadh districts
    {'x': 2, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_malaz', 'districtKey': 'al_malaz', 'population': 450000, 'density': 98},
    {'x': 3, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_olaya', 'districtKey': 'al_olaya', 'population': 380000, 'density': 92},
    {'x': 2, 'y': 4, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_naseem', 'districtKey': 'al_naseem', 'population': 320000, 'density': 85},
    {'x': 4, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_wurud', 'districtKey': 'al_wurud', 'population': 280000, 'density': 78},
    {'x': 3, 'y': 4, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_faisaliah', 'districtKey': 'al_faisaliah', 'population': 250000, 'density': 72},
    
    // Jeddah districts
    {'x': 1, 'y': 1, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_balad', 'districtKey': 'al_balad', 'population': 420000, 'density': 95},
    {'x': 2, 'y': 1, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_hamra', 'districtKey': 'al_hamra', 'population': 350000, 'density': 88},
    {'x': 1, 'y': 2, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_rawdah', 'districtKey': 'al_rawdah', 'population': 310000, 'density': 82},
    {'x': 2, 'y': 2, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_shati', 'districtKey': 'al_shati', 'population': 290000, 'density': 75},
    
    // Dammam districts
    {'x': 5, 'y': 2, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_corniche_dammam', 'districtKey': 'al_corniche_dammam', 'population': 290000, 'density': 80},
    {'x': 6, 'y': 2, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_aziziyah_dammam', 'districtKey': 'al_aziziyah_dammam', 'population': 270000, 'density': 73},
    
    // Mecca districts
    {'x': 0, 'y': 2, 'city': 'mecca', 'cityKey': 'mecca', 'district': 'al_haram_mecca', 'districtKey': 'al_haram_mecca', 'population': 380000, 'density': 90},
    {'x': 0, 'y': 3, 'city': 'mecca', 'cityKey': 'mecca', 'district': 'al_aziziyah_mecca', 'districtKey': 'al_aziziyah_mecca', 'population': 320000, 'density': 83},
    
    // Medina districts
    {'x': 0, 'y': 4, 'city': 'medina', 'cityKey': 'medina', 'district': 'al_haram_medina', 'districtKey': 'al_haram_medina', 'population': 350000, 'density': 87},
    {'x': 0, 'y': 5, 'city': 'medina', 'cityKey': 'medina', 'district': 'al_qiblatain', 'districtKey': 'al_qiblatain', 'population': 280000, 'density': 79},
  ];
}

