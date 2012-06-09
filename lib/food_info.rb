require 'faraday'
require 'nokogiri'
require 'nibbler'


PAGES = %w(
            e100-200 e200-300 e300-400 e400-500 e500-600
            e600-700 e700-800 e800-900 e900-1000 e1000-1300
            e1400-1500
          )

class Crawler

  def initialize()

  end

  def dump
    %w(pl uk).each do |lang|
      PAGES.each do |page|
        response, uri = Crawler.new.fetch "http://www.food-info.net/#{lang}/e/#{page}.htm";
        ingredients = IngredientsList.parse response.body

        ingredients.links.map do |link|
          response, uri = Crawler.new.fetch "http://www.food-info.net/#{lang}/e/#{link.url}"
          ingredient = IngredientShow.parse response.body
          i = Ingredient.new
          sections = ingredient.sections

          i.number = link.doc.content.strip
          p "***"
          p i.number

          title = ingredient.title
          if title && Ingredient.find_by_number(i.number).blank?
            p title

            names = [{ :name => title.gsub("\n", "").gsub("\r", "").scan(/\d+\s*?.*?:(.*)|\d+(.*)/).first.delete_if { |n| n.blank? }.first.strip, :main => true }]

            unless sections.first.titles.first.match /[Pp]ochodzenie|[Oo]rigin|[Ff]unkcje|[Ff]unction|[Pp]rodukty|[Pp]roducts|[Dd]opuszczalne|[Dd]aily|[Ee]fekty|[Ss]ide|[Oo]graniczenia|[Dd]ietary/
              names += sections.first.titles.delete_if {|t| t.blank?}.map do |name|
                name.gsub("\n", "").split(/\r|,/)
              end.flatten.map(&:strip).map do |n|
                { :name => n}
              end
            end

            i.names_attributes = names

            {
              :origin               => /[Pp]ochodzenie|[Oo]rigin/ ,
              :description          => /[Ff]unkcje|[Ff]unction/ ,
              :products_type        => /[Pp]rodukty|[Pp]roducts/ ,
              :daily_intake         => /[Dd]opuszczalne|[Dd]aily/ ,
              :side_effects         => /[Ee]fekty|[Ss]ide/ ,
              :dietary_restrictions => /[Oo]graniczenia|[Dd]ietary/
            }.each do |attr, regexp|
              p regexp
              section = sections.detect {|s| s.titles.present? && s.titles.first.match(regexp) }
              if section
                i.send( attr.to_s + "=", section.doc.content.gsub(section.titles.first, ""))
              end
            end

            i.save
          end
        end
      end
    end
    nil
  end

  def fetch(uri)
    response = Faraday.get uri
    if [301,302].include?(response.status)
      uri = response.headers['location']
      response = fetch(uri).first
    end
    [response, uri]
  end
end

class IngredientsList < Nibbler
  elements 'table table tr td p a' => :links do
    element '@href' => :url
  end
end

class IngredientShow < Nibbler
  elements 'table tr td[@bgcolor=white] > p:has(strong):not(:has(span.style2))' => :sections do
    elements 'strong' => :titles
  end
  element 'table tr td[@bgcolor=white] h1' => :title
end
