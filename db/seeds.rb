# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed-Data for specialities
['Alpine', 'Back-Country', 'Cross-Country', 'Downhill', 'Freestyle', 'Nordic', 'Telemark' ].each do |speciality|
  Speciality.create!( name: speciality )
end 

# Seed-Data for resort setup - TODO: define rake task
url = 'http://skimap.org/SkiAreas/index.xml'
response = HTTParty.get(url)
ski_areas = response['skiAreas'] rescue nil
ski_area = ski_areas['skiArea']

ski_area.each do |area| 
  r = Resort.create!(name: area['name'], area_id: area['id'] ) 
  r.search_skiarea
end
