namespace :loader do
  require 'csv'
  
  desc "carga general"
  task load_general: :environment do
    Rake::Task['loader:load_countries'].invoke
    Rake::Task['loader:load_autores'].invoke
    Rake::Task['loader:load_tecnica'].invoke
    Rake::Task['loader:load_fuente'].invoke
    Rake::Task['loader:load_categories1'].invoke
    Rake::Task['loader:load_desc_symbol'].invoke
    Rake::Task['loader:load_obras'].invoke
  end

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
		  p values[0]
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

    file = File.join(Rails.root, 'app', 'assets', 'data', 'autor_carga.csv')
    lines = File.new(file).readlines
      lines.each do |line|
        values = line.strip.split(',')
        attributes = {"name" => values[0]}
        Author.create(attributes)
      end
  end

  desc "tecnica"
  task load_tecnica: :environment do
    p "Tecnica"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'tecnica.csv')
    lines = File.new(file).readlines
    lines.each do |line|
      values = line.strip.split(',')
      attributes = {"name" => values[0]}
      Type.create(attributes)
    end

  end

  desc "fuente"
  task load_fuente: :environment do
    p "fuente"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'fuente.csv')
    lines = File.new(file).readlines
    lines.each do |line|
      values = line.strip.split('&;')
      attributes = {"name" => values[0]}
      Source.create(attributes)
    end

  end


  desc "Obras ficticias"
  task load_obras: :environment do
    p "Obras"

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
      a.engravings.new(:name=>"kelvin")

      desc = Description.find(i)
      if desc.nil?
        desc= Description.first
        end

      desc2 = Description.find(i+1)
      if desc2.nil?
        desc2= Description.first
      end

      desc3 = Description.find(i+2)
      if desc3.nil?
        desc3 = Description.first
      end

      a.descriptions<<desc

      a.descriptions<<desc2
      a.descriptions<<desc3

      sym = ArtworkSymbol.find(i)
      if sym.nil?
        sym= ArtworkSymbol.first
      end

      sym2 = ArtworkSymbol.find(i+1)
      if sym2.nil?
        sym2= ArtworkSymbol.first
      end

      sym3 = ArtworkSymbol.find(i+2)
      if sym3.nil?
        sym3 = ArtworkSymbol.first
      end

      a.artwork_symbols<<sym
      a.artwork_symbols<<sym2
      a.artwork_symbols<<sym3

      a.save!
    end
  end

  desc "Desc symbol"
  task load_desc_symbol: :environment do
    p "desc symbol"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'desc_symbol.csv')
    lines = File.new(file).readlines
    lines.each do |line|
      values = line.strip.split(',')
      attributes_desc = {"description" => values[0]}
      attributes_symb = {"name" => values[1]}
      Description.create(attributes_desc)
      ArtworkSymbol.create(attributes_symb)
    end
    end

  desc "Personajes Relato"
  task load_personajes_relato: :environment do
    p "Personajes relato"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'personajes_relato.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      if not row['Fecha de beatificación'].nil?
        beat_date = row['Fecha de beatificación']+"-01-01"
      else
        beat_date=nil
      end
      if not row['Fecha de muerte'].nil?
        death_date = row['Fecha de muerte']+"-01-01"
      else
        beat_date=nil
      end

      if not row['Fecha de canonización'].nil?
        cano_date = row['Fecha de canonización']+"-01-01"
      else
        cano_date=nil
      end

      attributes = {"id" => row['Id'],
                    "name" => row['Nombre'],
                    "biography" => row['Mini biografía'],
                    "death_date" => death_date,
                    "beatification_date" => beat_date,
                    "canonization_date" => cano_date
      }

      Character.create(attributes)
    end

  end

  desc "Load passage CSV"
  task passages_csv: :environment do
    p "Loading Passages..."
    file = File.join(Rails.root, 'app', 'assets', 'data', 'passages.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      Passage.create(:name => row['Título'],
        :id => row['Id'],
        :text => row['Pasaje'],
        :history_type => row['Tipo de historia'],
        :source => row['Fuente']
        )
    end
  end

end
