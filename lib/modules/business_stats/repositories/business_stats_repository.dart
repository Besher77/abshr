import '../models/business_question.dart';

/// Mock repository providing business statistics questions and options
class BusinessStatsRepository {
  List<BusinessSection> getSections() {
    return [
      BusinessSection(
        titleKey: 'business_section_activity',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q1',
            optionKeys: [
              'business_q1_opt1',
              'business_q1_opt2',
              'business_q1_opt3',
              'business_q1_opt4',
              'business_q1_opt5',
              'business_q1_opt6',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q2',
            optionKeys: [
              'yes',
              'no',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q3',
            optionKeys: [
              'business_q3_placeholder',
            ],
            isDate: true,
          ),
        ],
      ),
      BusinessSection(
        titleKey: 'business_section_sales',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q4',
            optionKeys: [
              'business_q4_opt1',
              'business_q4_opt2',
              'business_q4_opt3',
              'business_q4_opt4',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q5',
            optionKeys: [
              'business_q5_opt1',
              'business_q5_opt2',
              'business_q5_opt3',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q6',
            optionKeys: [
              'business_q6_opt1',
              'business_q6_opt2',
              'business_q6_opt3',
              'business_q6_opt4',
            ],
          ),
        ],
      ),
      BusinessSection(
        titleKey: 'business_section_employment',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q7',
            optionKeys: [
              'business_q7_opt1',
              'business_q7_opt2',
              'business_q7_opt3',
              'business_q7_opt4',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q8',
            optionKeys: [
              'yes',
              'no',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q8_followup',
            optionKeys: [
              'business_q8_opt1',
              'business_q8_opt2',
              'business_q8_opt3',
              'other',
            ],
          ),
        ],
      ),
      BusinessSection(
        titleKey: 'business_section_challenges',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q9',
            optionKeys: [
              'business_q9_opt1',
              'business_q9_opt2',
              'business_q9_opt3',
              'business_q9_opt4',
              'business_q9_opt5',
              'other',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q10',
            optionKeys: [
              'business_q10_opt1',
              'business_q10_opt2',
              'business_q10_opt3',
              'business_q10_opt4',
              'business_q10_opt5',
            ],
          ),
        ],
      ),
      BusinessSection(
        titleKey: 'business_section_opportunities',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q11',
            optionKeys: [
              'yes',
              'no',
              'not_sure',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q12',
            optionKeys: [
              'business_q12_opt1',
              'business_q12_opt2',
              'business_q12_opt3',
              'business_q12_opt4',
              'other',
            ],
          ),
        ],
      ),
      // Imports section
      BusinessSection(
        titleKey: 'business_section_imports',
        questions: [
          BusinessQuestion(
            titleKey: 'business_q_import_location',
            optionKeys: [
              'inside_ksa',
              'outside_ksa',
              'other',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q13',
            optionKeys: [
              'business_q13_opt1',
              'business_q13_opt2',
              'business_q13_opt3',
              'business_q13_opt4',
              'business_q13_opt5',
              'other',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q14',
            optionKeys: [
              'yes',
              'no',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q15',
            optionKeys: [
              'business_q15_opt1',
              'business_q15_opt2',
              'business_q15_opt3',
              'business_q15_opt4',
              'business_q15_opt5',
              'other',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q16',
            optionKeys: [
              'business_q16_opt1',
              'business_q16_opt2',
              'business_q16_opt3',
            ],
          ),
          BusinessQuestion(
            titleKey: 'business_q17',
            optionKeys: [
              'business_q17_opt1',
              'business_q17_opt2',
              'business_q17_opt3',
            ],
          ),
        ],
      ),
    ];
  }
}

