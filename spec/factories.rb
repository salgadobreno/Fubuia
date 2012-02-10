FactoryGirl.define do
  factory :user do
    facebook_uid '12345678'
    access_token 'af123ka23ak23'
    sequence(:email) {|n| "foo#{n}@example.com"}
  end

  factory :event do
    fid '12345678'
    association :user
    start_at Date.today
    active true
  end
end
