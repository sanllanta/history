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

  desc "Autores"
  task load_autores: :environment do
    p "Autores"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'autores.csv')
    lines = File.new(file).readlines
      lines.each do |line|
        values = line.strip.split(',')
        attributes = {"name" => values[0],"biography" => values[1]}
        Author.create(attributes)
      end
  end

  desc "Obras ficticias"
  task load_obras: :environment do
    p "Autores"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'obras.csv')
    lines = File.new(file).readlines
    i = 0
    lines.each do |line|
      i= i+1
      values = line.strip.split(',')
      attributes = {"title" => values[0],
                    "activity" => values[1],
                    "biographic_data" => values[2],
                    "synthesis" => values[3],
                    "biographic_comment" => values[4],
                    "annotation" => values[5],
                    "comment" => values[7],
                    "latitude_origin" => values[8],
                    "latitude_current" => values[9],
                    "longitude_origin" => values[10],
                    "longitude_current" => values[11]
                    }
      autor = Author.find(i)
      if autor.nil?
        autor =Author.first
      end
      a = Artwork.new(attributes)
      a.author = autor

      pla = Place.find(i)
      if pla.nil?
        pla = Place.first
      end
      a.place = pla

      cat = Category.find(i)
      if cat.nil?
        cat =Author.first
      end
      a.category_1= cat
      cat2 = cat.children.first
      if not cat2.nil?
        a.category_2= cat2
      end
      des1 = Description.new(:description => values[12])
      des2 = Description.new(:description => values[13])
      des3 = Description.new(:description => values[14])
      a.descriptions << des1
      a.descriptions << des2
      a.descriptions << des3
      a.save!
    end
  end

end
