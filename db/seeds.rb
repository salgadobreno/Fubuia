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

if Rails.env.mock?

  date_today = Date.civil(2012, 1, 26)
  datetime_today = DateTime.civil(2012,1,26)
  time_today = datetime_today.to_time

  Date.stubs(:today).returns(date_today)
  DateTime.stubs(:now).returns(datetime_today)
  Time.stubs(:now).returns(time_today)


  load 'spec/support/dummy_responses.rb'

  def rand_time(from, to)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

  def rand_in_range(from, to)
    rand * (to - from) + from
  end

  random_tags = "rock, 0800, gls, open-bar, gospel, black, dubstep, brasiliacapitaldorock".split(',')
  events_query.each do |x|
    Factory.create(:event, :active => true, :city => City.first, :user => User.first, :fid => x["eid"], :start_at => rand_time(DateTime.now - 3.days, DateTime.now + 3.days), :tag_list => random_tags.sample(4).join(',') ) unless Event.where(fid:x["eid"]).present?
  end

end
