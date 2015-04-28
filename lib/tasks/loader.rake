namespace :loader do
  require 'csv'

  #@ruta_imagenes = '/arca/project/imagenes/'
  @ruta_imagenes = '/home/kelvin/Documents/Historia/imagenes_jaime/base/'

  desc "Solo autores"
  task load_authors_with_lastname: :environment do
    p "Solo autores"
    Rake::Task['loader:load_autores'].invoke
    Rake::Task['loader:load_autores_apellido'].invoke
  end

  desc "carga general"
  task load_categorias: :environment do
    p "carga general"
    Rake::Task['loader:load_categories1'].invoke
  end

  desc "carga general"
  task load_general_test: :environment do
    p "carga general"
    Rake::Task['loader:load_countries'].invoke
    Rake::Task['loader:load_categories1'].invoke
    Rake::Task['loader:load_autores'].invoke
    Rake::Task['loader:load_tecnica'].invoke
    Rake::Task['loader:load_fuente'].invoke
    Rake::Task['loader:load_desc_symbol'].invoke
    Rake::Task['loader:load_personajes_relato'].invoke
    Rake::Task['loader:passages_csv'].invoke
    Rake::Task['loader:load_obras'].invoke
    Rake::Task['loader:load_autores_apellido'].invoke
  end

  desc "carga general"
  task load_general: :environment do
    p "carga general"
    Rake::Task['loader:load_countries'].invoke
    Rake::Task['loader:load_categories1'].invoke
    Rake::Task['loader:load_autores'].invoke
    Rake::Task['loader:load_tecnica'].invoke
    Rake::Task['loader:load_fuente'].invoke
    #Rake::Task['loader:load_desc_symbol'].invoke
    Rake::Task['loader:load_personajes_relato'].invoke
    Rake::Task['loader:passages_csv'].invoke
    Rake::Task['loader:load_obras_base1'].invoke
    Rake::Task['loader:load_autores_apellido'].invoke
  end

  desc "Loads the countries listed in countries.csv into the countries table"
  task load_countries: :environment do
  	file = File.join(Rails.root, 'app', 'assets', 'data', 'countries.csv')
  	lines = File.new(file).readlines
  	lines.each do |line|
		  values = line.strip.split(',')
		  attributes = {"code" => values[1], "name" => values[2], "name_spanish" => values[3]}
		  Country.create(attributes)

		end
  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories1: :environment do
  	p "cate1"
    file = File.join(Rails.root, 'app', 'assets', 'data', 'c1.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      if not row['Categorías 1'].nil?
		    attributes = {"name" => row['Categorías 1']}
        Category.create(attributes)
      end
    end
    Rake::Task['loader:load_categories12'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories12: :environment do
    p "cate12"
    file = File.join(Rails.root, 'app', 'assets', 'data', 'c1-2.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      base_all = Category.where(:name=>row['Categoría 1'])
      base_all.each do|base|
          p row['Categoría 1']
          p base.depth
          if(base.depth == 0)
            p "entro"
            attributes = {"name" => row['Categorías 2']}
            a = Category.new(attributes)
            a.parent = base
            a.save
            break
        end
      end
    end
    Rake::Task['loader:load_categories23'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories23: :environment do
    p "cate23"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'c2-3.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|

      base_all = Category.where(:name=>row['Categoría 2'])
      base_all.each do|base|
          if(base.depth == 1)
            attributes = {"name" => row['Categoría 3']}
            a = Category.new(attributes)
            a.parent = base
            a.save
            break
        end
      end
    end
    Rake::Task['loader:load_categories34'].invoke
  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories34: :environment do
    p "cate34"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'c3-4.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|

      base_all = Category.where(:name=>row['Categoría 3'])
      base_all.each do|base|
          if(base.depth == 2)
            attributes = {"name" => row['Categoría 4']}
            a = Category.new(attributes)
            a.parent = base
            a.save
            break
        end
      end
    end
    Rake::Task['loader:load_categories45'].invoke

  end

  desc "Loads the category level 0 listed in cate1.csv into the Category table"
  task load_categories45: :environment do
    p "cate45"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'c4-5.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|

      base_all = Category.where(:name=>row['Categoría 4'])
      base_all.each do|base|
          if(base.depth == 3)
            attributes = {"name" => row['Categoría 5']}
            a = Category.new(attributes)
            a.parent = base
            a.save
            break
        end
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
        nombre = values[0]
        nombre.strip!
        attributes = {"name" => nombre}
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

      pla = Country.find(i)
      if pla.nil?
        pla = Country.first
      end
      a.origin_country = pla

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
    # new_max = maximum(primary_key) || 0
    # comadno = "SELECT setval('company_id_seq', (SELECT max(id) FROM company));"
    # ActiveRecord::Base.connection.execute(comadno)
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
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

  desc "Obras base 1"
  task load_obras_base1: :environment do
    p "Loading artworks..."
    #file = File.join(Rails.root, 'app', 'assets', 'data', 'obras_base_1.csv')
    file = File.join(Rails.root, 'app', 'assets', 'data', 'export.csv')
    i = 0
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      i = i+1
      p i
      if i== 100
        #break
      end

      if row.length== 21
        if !/\A\d+\z/.match(row['Id'])
          break
        else

          #Escenario;
          scene = Scene.find_or_create_by(:name=>row['Escenario'])
          #TipoRelato;
          tipo_relato = StoryType.find_or_create_by(:name=>row['TipoRelato'])
          #NombreDonante;
          donante = Donor.find_or_create_by(:name=>row['NombreDonante'])
          #Cartela;
          cartela = PhylacteryBillboard.find_or_create_by(:name=>row['Cartela'])
          #Simbolos;
          p row['Id']
          if row['Simbolos']
            p row['Simbolos']
            s = ArtworkSymbol.where("name LIKE :prefix", prefix: "%#{row['Simbolos']}%")[0]
            p s
            simbolos = ArtworkSymbol.find_or_create_by(:name=>row['Simbolos'])
          else
            simbolos = nil
          end
          #Id Imagen;
          #Autor;
          autor = Author.find_or_create_by(:name=>row['Autor'])
          #Titulo;
          titulo = row['Titulo']
          #Fecha;
          #ComentariosBiblio;
          comentariosBiblio = row['ComentariosBiblio']
          #Técnica;
          tecnica = Type.find_or_create_by(:name=>row['Técnica'])
          #ProcedenciaIm;
          #origen = Origin.find_or_create_by(:name=>row['ProcedenciaIm'])
          #Fuenteimagen;
          fuente = Source.find_or_create_by(:name=>row['Fuenteimagen'])
          # Ciudad;
          #ciudad = Place.find_or_create_by(:name=>row['Ciudad'])
          # Anotaciones;
          anotaciones = row['Anotaciones']
          # Id Relato - Personaje;
          if row['Id Relato - Personaje']
            p "id relato"
            begin
              id = row['Id Relato - Personaje'].to_i
              personaje = Character.find_by(:id=>id)
              p row['Id Relato - Personaje']
            rescue
              personaje = nil
              p row['Id Relato - Personaje']
              p 'Error: Id Relato - Personaje'
            end

          end
          # Id Pasaje;
          # Atributos iconográficos;
          atributos = IconographicAttribute.find_or_create_by(:name=>row['Atributos iconográficos'])
          # Personajes excluidos;
          p "personaje excluido"
          p row['Personajes excluidos']
          personaje_excluido = Character.find_or_create_by(:name=>row['Personajes excluidos'])
          p row['Personajes excluidos']
          # Sintesis
          sintesis = row['Sintesis']
          #p scene.id
          f_avatar = nil
          if row['Id Imagen']
            if File.exist?(@ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.jpg')
              p @ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.jpg'
              f_avatar = File.open(@ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.jpg')
            elsif File.exist?(@ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.JPG')
              p @ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.JPG'
              f_avatar = File.open(@ruta_imagenes+(16000+row['Id Imagen'].to_i).to_s+ '.JPG')
            else
              p "No se encontró imagen #{16000+row['Id Imagen'].to_i}"
            end
          else
            p "No se agrego imagen"
          end
          artwork = Artwork.create(
              #:passage_id=>
              :avatar =>f_avatar,
              :author_id=>autor.id,
              #:place_id=>ciudad.id,
              :scene_id=>scene.id,
              :type_id=>tecnica.id,
              :source_id=>fuente.id,
              :donor_id=>donante.id,
              :iconographic_attribute_id=>atributos.id,
              :phylactery_billboard_id=>cartela.id,
              :story_type_id=>tipo_relato.id,
              :title=>titulo,
              :annotation=>anotaciones,
              :synthesis=>sintesis,
              :biographic_comment=>comentariosBiblio
              )
          artwork.save!
          if simbolos
            artwork.artwork_symbols << simbolos
          end
          if personaje
            artwork.characters << personaje
            artwork.characters << personaje_excluido
          end
          artwork.save!

        end
      else
        p "tamaño"
        p row.length
        p "id"
        p row['Id']
        p "id relato"
        p row['Id Relato - Personaje']
        break
      end
    end
  end

  desc "Autores apellidos"
  task load_autores_apellido: :environment do
    p "Autores edicion apellidos"

    file = File.join(Rails.root, 'app', 'assets', 'data', 'autores_apellido.csv')
    CSV.foreach(file, :headers => true, :col_sep => ';') do |row|
      obj = Author.find_by_name(row['base'])
      if obj.nil?
        Author.create(:name=> row['nombre'],:lastname => row['apellido']).save
        p "Creado: #{row['nombre']}, #{row['apellido']} de #{row['base']}"
      else
        obj.name = row['nombre']
        obj.lastname = row['apellido']
        obj.save
      end
    end
  end

end
