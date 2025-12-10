/// Mock data for dashboard
/// All mocked data should be defined here
class MockData {
  MockData._();

  // Nationalities
  static final Map<String, int> expatsByNationality = {
    'Filipino': 125000,
    'Indian': 98000,
    'Pakistani': 87000,
    'Bangladeshi': 65000,
    'Egyptian': 45000,
    'Nepali': 38000,
    'Sri Lankan': 32000,
    'Other': 55000,
  };

  // Cities (using keys for localization)
  static final Map<String, int> expatsByCity = {
    'riyadh': 180000,
    'jeddah': 120000,
    'dammam': 75000,
    'mecca': 45000,
    'medina': 35000,
    'khobar': 30000,
    'other': 40000,
  };

  // Districts (using keys for localization)
  static final Map<String, int> expatsByDistrict = {
    'al_malaz': 25000,
    'al_olaya': 22000,
    'al_naseem': 18000,
    'al_wurud': 15000,
    'al_faisaliah': 12000,
    'other': 100000,
  };

  // Gender
  static final Map<String, int> expatsByGender = {
    'Male': 380000,
    'Female': 120000,
  };

  // Age ranges
  static final Map<String, int> expatsByAge = {
    '18-25': 80000,
    '26-35': 180000,
    '36-45': 150000,
    '46-55': 60000,
    '55+': 30000,
  };

  // Job types
  static final Map<String, int> expatsByJobType = {
    'Construction': 120000,
    'Healthcare': 65000,
    'Education': 45000,
    'IT': 35000,
    'Hospitality': 40000,
    'Retail': 55000,
    'Other': 95000,
  };

  // Monthly movement data (last 12 months)
  static final List<Map<String, dynamic>> monthlyMovement = [
    {'month': 'january', 'in': 12000, 'out': 8500},
    {'month': 'february', 'in': 13500, 'out': 9200},
    {'month': 'march', 'in': 11800, 'out': 8800},
    {'month': 'april', 'in': 14200, 'out': 7600},
    {'month': 'may', 'in': 12800, 'out': 9100},
    {'month': 'june', 'in': 15000, 'out': 9800},
    {'month': 'july', 'in': 13200, 'out': 8700},
    {'month': 'august', 'in': 14500, 'out': 9400},
    {'month': 'september', 'in': 13800, 'out': 8900},
    {'month': 'october', 'in': 15200, 'out': 10100},
    {'month': 'november', 'in': 14000, 'out': 9600},
    {'month': 'december', 'in': 14800, 'out': 9200},
  ];

  // Predictions
  static final List<String> predictions = [
    'prediction_1',
    'prediction_2',
    'prediction_3',
  ];

  // Heatmap data - City/District coordinates and density (using keys for localization)
  static final List<Map<String, dynamic>> heatmapData = [
    // Riyadh districts
    {'x': 2, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_malaz', 'districtKey': 'al_malaz', 'density': 95, 'expats': 25000},
    {'x': 3, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_olaya', 'districtKey': 'al_olaya', 'density': 88, 'expats': 22000},
    {'x': 2, 'y': 4, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_naseem', 'districtKey': 'al_naseem', 'density': 75, 'expats': 18000},
    {'x': 4, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_wurud', 'districtKey': 'al_wurud', 'density': 65, 'expats': 15000},
    {'x': 3, 'y': 4, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_faisaliah', 'districtKey': 'al_faisaliah', 'density': 55, 'expats': 12000},
    {'x': 1, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_shumaisi', 'districtKey': 'al_shumaisi', 'density': 45, 'expats': 10000},
    {'x': 5, 'y': 3, 'city': 'riyadh', 'cityKey': 'riyadh', 'district': 'al_murabba', 'districtKey': 'al_murabba', 'density': 40, 'expats': 9000},
    
    // Jeddah districts
    {'x': 1, 'y': 1, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_balad', 'districtKey': 'al_balad', 'density': 85, 'expats': 30000},
    {'x': 2, 'y': 1, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_hamra', 'districtKey': 'al_hamra', 'density': 78, 'expats': 25000},
    {'x': 1, 'y': 2, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_rawdah', 'districtKey': 'al_rawdah', 'density': 70, 'expats': 22000},
    {'x': 2, 'y': 2, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_shati', 'districtKey': 'al_shati', 'density': 60, 'expats': 18000},
    {'x': 3, 'y': 1, 'city': 'jeddah', 'cityKey': 'jeddah', 'district': 'al_aziziyah_jeddah', 'districtKey': 'al_aziziyah_jeddah', 'density': 50, 'expats': 15000},
    
    // Dammam districts
    {'x': 5, 'y': 2, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_faisaliyah', 'districtKey': 'al_faisaliyah', 'density': 72, 'expats': 20000},
    {'x': 6, 'y': 2, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_corniche_dammam', 'districtKey': 'al_corniche_dammam', 'density': 65, 'expats': 18000},
    {'x': 5, 'y': 3, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_aziziyah_dammam', 'districtKey': 'al_aziziyah_dammam', 'density': 55, 'expats': 15000},
    {'x': 6, 'y': 3, 'city': 'dammam', 'cityKey': 'dammam', 'district': 'al_shatea', 'districtKey': 'al_shatea', 'density': 45, 'expats': 12000},
    
    // Mecca districts
    {'x': 0, 'y': 2, 'city': 'mecca', 'cityKey': 'mecca', 'district': 'al_haram_mecca', 'districtKey': 'al_haram_mecca', 'density': 80, 'expats': 20000},
    {'x': 0, 'y': 3, 'city': 'mecca', 'cityKey': 'mecca', 'district': 'al_aziziyah_mecca', 'districtKey': 'al_aziziyah_mecca', 'density': 65, 'expats': 15000},
    {'x': 0, 'y': 1, 'city': 'mecca', 'cityKey': 'mecca', 'district': 'al_shisha', 'districtKey': 'al_shisha', 'density': 50, 'expats': 10000},
    
    // Medina districts
    {'x': 0, 'y': 4, 'city': 'medina', 'cityKey': 'medina', 'district': 'al_haram_medina', 'districtKey': 'al_haram_medina', 'density': 70, 'expats': 18000},
    {'x': 0, 'y': 5, 'city': 'medina', 'cityKey': 'medina', 'district': 'al_qiblatain', 'districtKey': 'al_qiblatain', 'density': 55, 'expats': 12000},
    {'x': 1, 'y': 4, 'city': 'medina', 'cityKey': 'medina', 'district': 'al_anbariyah', 'districtKey': 'al_anbariyah', 'density': 45, 'expats': 10000},
    
    // Khobar districts
    {'x': 7, 'y': 2, 'city': 'khobar', 'cityKey': 'khobar', 'district': 'al_corniche_khobar', 'districtKey': 'al_corniche_khobar', 'density': 68, 'expats': 15000},
    {'x': 7, 'y': 3, 'city': 'khobar', 'cityKey': 'khobar', 'district': 'al_izdihar', 'districtKey': 'al_izdihar', 'density': 58, 'expats': 12000},
    {'x': 8, 'y': 2, 'city': 'khobar', 'cityKey': 'khobar', 'district': 'al_hamra_khobar', 'districtKey': 'al_hamra_khobar', 'density': 48, 'expats': 10000},
  ];

  // Total expats
  static int get totalExpats {
    return expatsByNationality.values.reduce((a, b) => a + b);
  }
}

