# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  leagues = [{:name=>"Browntown", :size=>10}]
  leagues.each { |l| League.create!(l) }

  managers = [{:name=>"Krishna", :league=> League.first }, {:name=>"Chiraag", :league=> League.first }, {:name=>"Ashish", :league=> League.first }]
  managers.each { |m| Manager.create!(m) }

  rosters = [{:name=>"Krishna's Team", :manager_id=>1 }, {:name=>"Chiraag's Team", :manager_id=>2 }, {:name=>"Ashish's Team", :manager_id=>3 }]
  rosters.each { |r| Roster.create!(r) }

  ## Read in players from yahoo
  file = File.read("players_p1.html")
  page = Nokogiri::HTML(file)
  table = page.search("#draftanalysistable")
  rows = table.search("tbody tr")
  parsed = rows.map do |row|
    {
      name: row.search(".ysf-player-name a").text,
      position: row.search(".ysf-player-name span").text[-2..-1],
      proj_value: row.search("td[4]").text.slice(/[\d\.]+/).to_f,
      avg_cost: row.search("td[5]").text.slice(/[\d\.]+/).to_f,
    }
  end
  parsed.each do |p|
    proj, avg = p.delete(:proj_value), p.delete(:avg_cost)
    interpolated_value = (proj + 2 * avg) / 3.0
    p[:public_value] = interpolated_value
    p[:league] = League.first

    Player.create!(p)
  end
end

