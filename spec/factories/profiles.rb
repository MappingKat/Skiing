# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    type ""
    level "MyString"
    favorite_resorts "MyString"
    off_piste false
    state "MyString"
    picture "MyText"
    bio "MyText"
  end
end
