namespace :loader do
  desc "Loads the countries listed in countries.csv into the places table"
  task load_countries: :environment do
  	file = File.join(Rails.root, 'app', 'assets', 'data', 'countries.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')
		  attributes = {"name" => values[2],"code" => values[1]}
		  Place.create(attributes)
		end
  end
end
