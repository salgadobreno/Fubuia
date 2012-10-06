#coding: UTF-8
FactoryGirl.define do
  factory :user do
    uid '12345678'
    oauth_token 'af123ka23ak23'
    sequence(:email) {|n| "foo#{n}@example.com"}
  end

  factory :event do
    fid '12345678'
    association :user
    city_id { City.find_by_subdomain('brasilia').id }
    start_at Date.today
    active true
  end

  factory :city do
    name 'Brasília'
    subdomain 'brasilia'
  end

  factory :tag do
    name 'tag'
  end
end
