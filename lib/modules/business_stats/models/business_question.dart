class BusinessQuestion {
  final String titleKey;
  final List<String> optionKeys;
  final bool isDate;

  BusinessQuestion({
    required this.titleKey,
    required this.optionKeys,
    this.isDate = false,
  });
}

class BusinessSection {
  final String titleKey;
  final List<BusinessQuestion> questions;

  BusinessSection({
    required this.titleKey,
    required this.questions,
  });
}

