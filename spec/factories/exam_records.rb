FactoryGirl.define do
  factory :exam_record, class: 'Exam::Record' do
    sbp 1
    dbp 2
    pulse 3
    bo 4
    fetalheart 5
    glu 6
    chol 7
    ua 8
    fat 9
    bmr 10
    water 11
    height 12
    weight 13
    bmi 14
    waistline 15
    hipline 16
    whr 17
    date Time.zone.today
  end

  factory :exam_record1, class: 'Exam::Record' do
    sbp 11
    dbp 21
    pulse 31
    bo 41
    fetalheart 51
    glu 61
    chol 71
    ua 81
    fat 91
    bmr 101
    water 111
    height 121
    weight 131
    bmi 141
    waistline 151
    hipline 161
    whr 171
    date Time.zone.today-1
  end

  factory :exam_record2, class: 'Exam::Record' do
    sbp 12
    dbp 22
    pulse 32
    bo 42
    fetalheart 52
    glu 62
    chol 72
    ua 82
    fat 92
    bmr 102
    water 112
    height 122
    weight 132
    bmi 142
    waistline 152
    hipline 162
    whr 172
    date Time.zone.today-2
  end
end
