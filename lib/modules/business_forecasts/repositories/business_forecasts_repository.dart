import '../models/business_forecast_question.dart';

/// Repository providing business forecasts and statistics questions
class BusinessForecastsRepository {
  List<BusinessForecastSection> getSections() {
    return [
      // أولاً: بيانات النشاط التجاري الأساسية
      BusinessForecastSection(
        titleKey: 'forecast_section_basic_activity',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q1_business_type',
            optionKeys: [
              'forecast_q1_opt1',
              'forecast_q1_opt2',
              'forecast_q1_opt3',
              'forecast_q1_opt4',
              'forecast_q1_opt5',
              'forecast_q1_opt6',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q2_sector',
            optionKeys: [
              'forecast_q2_opt1',
              'forecast_q2_opt2',
              'forecast_q2_opt3',
              'forecast_q2_opt4',
              'forecast_q2_opt5',
              'forecast_q2_opt6',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q3_working_hours',
            optionKeys: [
              'forecast_q3_opt1',
              'forecast_q3_opt2',
              'forecast_q3_opt3',
              'forecast_q3_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q4_working_days',
            optionKeys: [
              'forecast_q4_opt1',
              'forecast_q4_opt2',
              'forecast_q4_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q5_location',
            optionKeys: [
              'forecast_q5_opt1',
              'forecast_q5_opt2',
              'forecast_q5_opt3',
              'forecast_q5_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q6_branches',
            optionKeys: [
              'forecast_q6_opt1',
              'forecast_q6_opt2',
              'forecast_q6_opt3',
              'forecast_q6_opt4',
            ],
          ),
        ],
      ),
      // ثانيًا: بيانات القوى العاملة
      BusinessForecastSection(
        titleKey: 'forecast_section_workforce',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q7_employees',
            optionKeys: [
              'forecast_q7_opt1',
              'forecast_q7_opt2',
              'forecast_q7_opt3',
              'forecast_q7_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q8_saudization',
            optionKeys: [
              'forecast_q8_opt1',
              'forecast_q8_opt2',
              'forecast_q8_opt3',
              'forecast_q8_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q9_gender',
            optionKeys: [
              'forecast_q9_opt1',
              'forecast_q9_opt2',
              'forecast_q9_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q10_job_type',
            optionKeys: [
              'forecast_q10_opt1',
              'forecast_q10_opt2',
              'forecast_q10_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q11_future_hiring',
            optionKeys: [
              'yes',
              'no',
              'not_sure',
            ],
          ),
        ],
      ),
      // ثالثًا: البيانات المالية
      BusinessForecastSection(
        titleKey: 'forecast_section_financial',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q12_revenue_range',
            optionKeys: [
              'forecast_q12_opt1',
              'forecast_q12_opt2',
              'forecast_q12_opt3',
              'forecast_q12_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q13_operational_expenses',
            optionKeys: [
              'forecast_q13_opt1',
              'forecast_q13_opt2',
              'forecast_q13_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q14_financial_performance',
            optionKeys: [
              'forecast_q14_opt1',
              'forecast_q14_opt2',
              'forecast_q14_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q15_profitability',
            optionKeys: [
              'forecast_q15_opt1',
              'forecast_q15_opt2',
              'forecast_q15_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q16_government_fees',
            optionKeys: [
              'forecast_q16_opt1',
              'forecast_q16_opt2',
              'forecast_q16_opt3',
            ],
          ),
        ],
      ),
      // رابعًا: بيانات المنتجات والخدمات
      BusinessForecastSection(
        titleKey: 'forecast_section_products',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q17_best_selling',
            optionKeys: [
              'forecast_q17_opt1',
              'forecast_q17_opt2',
              'forecast_q17_opt3',
              'forecast_q17_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q18_avg_price',
            optionKeys: [
              'forecast_q18_opt1',
              'forecast_q18_opt2',
              'forecast_q18_opt3',
              'forecast_q18_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q19_customer_preferences',
            optionKeys: [
              'forecast_q19_opt1',
              'forecast_q19_opt2',
              'forecast_q19_opt3',
            ],
          ),
        ],
      ),
      // خامسًا: بيانات العمليات والتشغيل
      BusinessForecastSection(
        titleKey: 'forecast_section_operations',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q20_avg_orders',
            optionKeys: [
              'forecast_q20_opt1',
              'forecast_q20_opt2',
              'forecast_q20_opt3',
              'forecast_q20_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q21_compliance',
            optionKeys: [
              'forecast_q21_opt1',
              'forecast_q21_opt2',
              'forecast_q21_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q22_delivery_time',
            optionKeys: [
              'forecast_q22_opt1',
              'forecast_q22_opt2',
              'forecast_q22_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q23_return_rate',
            optionKeys: [
              'forecast_q23_opt1',
              'forecast_q23_opt2',
              'forecast_q23_opt3',
            ],
          ),
        ],
      ),
      // سادسًا: مؤشرات الامتثال والجودة
      BusinessForecastSection(
        titleKey: 'forecast_section_compliance',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q24_quality_rating',
            optionKeys: [
              'forecast_q24_opt1',
              'forecast_q24_opt2',
              'forecast_q24_opt3',
              'forecast_q24_opt4',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q25_licenses_status',
            optionKeys: [
              'forecast_q25_opt1',
              'forecast_q25_opt2',
              'forecast_q25_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q26_complaints',
            optionKeys: [
              'forecast_q26_opt1',
              'forecast_q26_opt2',
              'forecast_q26_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q27_customer_rating',
            optionKeys: [
              'forecast_q27_opt1',
              'forecast_q27_opt2',
              'forecast_q27_opt3',
              'forecast_q27_opt4',
            ],
          ),
        ],
      ),
      // سابعًا: مؤشرات اقتصادية عامة
      BusinessForecastSection(
        titleKey: 'forecast_section_economic',
        questions: [
          BusinessForecastQuestion(
            titleKey: 'forecast_q28_growth_index',
            optionKeys: [
              'forecast_q28_opt1',
              'forecast_q28_opt2',
              'forecast_q28_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q29_sector_distribution',
            optionKeys: [
              'forecast_q29_opt1',
              'forecast_q29_opt2',
              'forecast_q29_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q30_market_opportunities',
            optionKeys: [
              'forecast_q30_opt1',
              'forecast_q30_opt2',
              'forecast_q30_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q31_declining_activities',
            optionKeys: [
              'forecast_q31_opt1',
              'forecast_q31_opt2',
              'forecast_q31_opt3',
            ],
          ),
          BusinessForecastQuestion(
            titleKey: 'forecast_q32_ai_forecasts',
            optionKeys: [
              'forecast_q32_opt1',
              'forecast_q32_opt2',
              'forecast_q32_opt3',
            ],
          ),
        ],
      ),
    ];
  }
}

