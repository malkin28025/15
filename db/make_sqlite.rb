require 'csv'
require 'sqlite3'

database = SQLite3::Database.open "nfl.db"
#=begin
CSV.foreach('states.csv') do |row|
  next if row[0] == 'id'
  sql = "INSERT INTO states (id, name, abbr, capital, biggest_city, population, area) VALUES("
  data = row.map do |cell|
    cell.to_i == 0 ? "'#{cell}'" : cell
  end
  puts "#{sql}#{data.join(', ')});"
  database.execute "#{sql}#{data.join(', ')});"
end
#=end
city_id = 1
CSV.foreach('cities.csv') do |row|
  next if row[0] == '2013 rank'
  sql = "INSERT INTO cities (id, name, population_2013, population_2010, population_change, population_density, state_id) VALUES("
  data_with_extra_columns = row.map do |cell|
    cell.to_i == 0 && (cell =~ /\./).nil? || cell.include?('St.') ? "'#{cell}'" : cell
  end
  if data_with_extra_columns[5] =~ /[^0-9\.]/
    data_with_extra_columns[5].sub!(/[^0-9\.]/, '-')
  end
  data = [city_id, data_with_extra_columns[1], data_with_extra_columns[3],
          data_with_extra_columns[4], data_with_extra_columns[5], data_with_extra_columns[7],
          data_with_extra_columns[8]]
  puts "#{sql}#{data.join(', ')});"
  database.execute "#{sql}#{data.join(', ')});"
  city_id += 1
end
#=begin
team_id = 1
CSV.foreach('nfl.csv') do |row|
  next if row[0] == 'City' || row[0].nil?
  sql = "INSERT INTO teams (id, name, wins, losses, ties, division, conference, playoff, city_id) VALUES ("
  data = row.map do |cell|
    if cell == 'TRUE'
      1
    elsif cell == 'FALSE'
      0
    elsif cell != '0' && (cell.to_i == 0 || cell == '49ers')
      "'#{cell}'" 
    else
      cell
    end
  end
  data[0] = team_id
  puts "#{sql}#{data.join(', ')});"
  database.execute "#{sql}#{data.join(', ')});"
  team_id += 1
end
#=end

database.close
