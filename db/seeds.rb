#coding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[ ["Brasília", "brasilia"], ["Rio de Janeiro", "rio"] ].each do |ar|
  City.find_or_create_by_name_and_subdomain(ar[0], ar[1])
end
