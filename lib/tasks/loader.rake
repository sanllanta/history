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

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories1: :environment do
  	p "cate1"
    file = File.join(Rails.root, 'app', 'assets', 'data', 'cate1.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')
		  attributes = {"name" => values[0]}
		  Category.create(attributes)
    end
    Rake::Task['loader:load_categories12'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories12: :environment do
    p "cate12"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'cate1-2.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')

      base = Category.find_by_name(values[0])
      if not base.nil?
		    attributes = {"name" => values[1]}
        a = Category.new(attributes)
        a.parent = base
        a.save
      elsif
        p values[0]
      end
    end
    Rake::Task['loader:load_categories23'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories23: :environment do
    p "cate23"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'cate2-3.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')

      base = Category.find_by_name(values[0])
      if not base.nil?
		    attributes = {"name" => values[1]}
        a = Category.new(attributes)
        a.parent = base
        a.save
      elsif
        p values[0]
      end
    end
    Rake::Task['loader:load_categories34'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories34: :environment do
    p "cate34"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'cate3-4.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')

      base = Category.find_by_name(values[0])
      if not base.nil?
		    attributes = {"name" => values[1]}
        a = Category.new(attributes)
        a.parent = base
        a.save
      elsif
        p values[0]
      end
    end
    Rake::Task['loader:load_categories45'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories45: :environment do
    p "cate45"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'cate4-5.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')

      base = Category.find_by_name(values[0])
      if not base.nil?
		    attributes = {"name" => values[1]}
        a = Category.new(attributes)
        a.parent = base
        a.save
      elsif
        p values[0]
      end
		end
  end

end
