# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    role 'user'
  end

  factory :admin do
    role 'admin'
  end
end
