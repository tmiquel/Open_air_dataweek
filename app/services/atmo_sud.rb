class AtmoSud
require 'nokogiri'

def marseille_air_indice
	page = Nokogiri::HTML(open("https://www.atmosud.org/monair/commune/13055"))   
    return page.css('div.indice').text   # => Nokogiri::HTML::Document
end
def toulon_air_indice
	page = Nokogiri::HTML(open("https://www.atmosud.org/monair/commune/83137"))   
    return page.css('div.indice').text   # => Nokogiri::HTML::Document
end
def marseille_air_alerte
	page = Nokogiri::HTML(open("https://www.atmosud.org/monair/commune/13055"))   
    return page.css('div.bx-wrapper').text   # => Nokogiri::HTML::Document
end
def nice_air_indice
	page = Nokogiri::HTML(open("https://www.atmosud.org/monair/commune/06088"))   
    return page.css('div.indice').text   # => Nokogiri::HTML::Document
end


end