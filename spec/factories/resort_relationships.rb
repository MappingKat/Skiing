# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resort_relationship do
    instructor nil
    resort nil
    instructor_state "MyString"
    favorite false
  end
end
