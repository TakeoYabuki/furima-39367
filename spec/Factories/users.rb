FactoryBot.define do

  factory :user do
    nickname              {"Takeo"}
    email                 {Faker::Internet.free_email}
    password              {"Takeo35"}
    password_confirmation {password}
    first_name            {"剛央"}
    last_name             {"矢吹"}
    first_name_kana       {"タケオ"}
    last_name_kana        {"ヤブキ"}
    birthday             {"2000-01-01"}
  end
end