FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { '123bg@gmail.com' }
    password              { 'a121bDC' }
    password_confirmation { password }
    last_name             { '山田' }
    last_name_kana        { 'ヤマダ' }
    first_name            { '陸太郎' }
    first_name_kana       { 'リクタロ' }
    birthday              { '2000-01-01' }
  end
end
