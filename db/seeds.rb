# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  leagues = [{:name=>"Healthifantasy", :size=>12}]
  leagues.each { |l| League.create!(l) }

  managers = [
    {:name=>"Krishna"},
    {:name=>"Daniel"},
    {:name=>"Kailyn"},
    {:name=>"Luke"},
    {:name=>"Joshua"},
    {:name=>"Chet"},
    {:name=>"Eric"},
    {:name=>"Sara"},
    {:name=>"Brady"},
    {:name=>"Kojo"},
    {:name=>"Cam"},
    {:name=>"Mihir"},
  ]
  managers.each do |m|
    manager = Manager.create!({league: League.first}.merge(m))
    Roster.create!(Roster::POSITIONS_NEEDED.merge(manager: manager, name: "#{manager.name}'s Roster"))
  end

  def standardize_name(name)
    name.gsub(/(j|J|s|S)r\.?/, "").delete(".").delete("'").titleize.strip
  end

  def standardize_def(name)
    if name.include?("Los Angeles")
      if name.split(" ").count == 3
        name
      elsif @second_la_team
        "Los Angeles Rams"
      else
        "Los Angeles Chargers"
        @second_la_team = true
      end

    elsif name.include?("New York")
      if name.split(" ").count == 3
        name
      elsif @second_ny_team
        "New York Jets"
      else
        "New York Giants"
        @second_ny_team = true
      end
    elsif name.match(/Tampa Bay|New England|Green Bay/)
      name.split(" ").take(2).join(" ")
    else
      name.split(" ").first
    end
  end

  ## Read in players from yahoo
  6.times do |i|
    file = File.read("yahoo#{i + 1}.html")
    page = Nokogiri::HTML(file)
    table = page.search("#draftanalysistable")
    rows = table.search("tbody tr")
    parsed = rows.map do |row|
      name = row.search(".ysf-player-name a").text
      position = row.search(".ysf-player-name span").text.slice(/[A-Z]+$/)
      if position == "DEF"
        name = standardize_def(name)
      else
        name = standardize_name(name)
      end

      {
        name: name,
        position: position,
        proj_value: row.search("td[4]").text.slice(/[\d\.]+/).to_f,
        avg_cost: row.search("td[5]").text.slice(/[\d\.]+/).to_f,
      }
    end
    parsed.each do |p|
      proj, avg = p.delete(:proj_value), p.delete(:avg_cost)
      interpolated_value = (proj + 3 * avg) / 4.0
      p[:public_value] = interpolated_value
      p[:league] = League.first

      Player.create!(p)
    end
  end

  path = "beersheets12.csv"
  require "csv"
  rows = CSV.readlines(path, headers: true).map(&:to_h)
  names = []
  rows.each do |row|
    position = row.fetch("position")
    name = row.fetch("name").slice(/[a-zA-Z\s]+/)
    if position == "DEF"
      name = standardize_def(name)
    else
      name = standardize_name(name)
    end
    
    player = Player.find_by(name: name, position: position)
    player && player.update!(private_value: row.fetch("private_value").to_f)
  end
end

