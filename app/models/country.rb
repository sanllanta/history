class Country < ActiveRecord::Base
  has_many :artworks

  def self.filtros_place(author_lastname, category_id, country_id)
    query = 'SELECT "countries".* FROM "countries" RIGHT JOIN
    (SELECT A.* FROM "categories"
      RIGHT JOIN (SELECT "artworks".* FROM "artworks"
        LEFT JOIN authors ON authors.id = artworks.author_id
      %{author_query})A
        ON categories.id = A.category_1_id
    %{category_query})A2
    ON countries.id = A2.origin_country_id %{country_query}'

    author_query = ""
    category_query = ""
    country_query = ""

    author_lastname ? author_query = "WHERE authors.lastname LIKE '%#{author_lastname}%'" : author_query = ""

    category_id ? category_query = "WHERE categories.id = #{category_id}" : category_query = ""

    country_id ? country_query = "WHERE countries.id = #{country_id}" : country_query = ""

    find_by_sql (query % {author_query: author_query, category_query: category_query, country_query: country_query})
  end
end
