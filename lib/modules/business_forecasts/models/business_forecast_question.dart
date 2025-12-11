class BusinessForecastQuestion {
  final String titleKey;
  final List<String> optionKeys;
  final bool isDate;

  BusinessForecastQuestion({
    required this.titleKey,
    required this.optionKeys,
    this.isDate = false,
  });
}

class BusinessForecastSection {
  final String titleKey;
  final List<BusinessForecastQuestion> questions;

  BusinessForecastSection({
    required this.titleKey,
    required this.questions,
  });
}

