class AtmoSud
require 'nokogiri'

  def hash_city
    city = {"Marseille" => "13055", "Toulon" => "83137","Aix en Provence" => "13001", "Avignon" => "84007", "Nice" => "06088", "La Ciotat" => "13028"}
  end


  def url 
    h =  hash_city.values
    urls_array = []
	h.each do |i|
	  urls_array << "https://www.atmosud.org/monair/commune/#{i}"
	end
	return urls_array
  end


  def array_name 
    h =  hash_city.keys
 return h
  end

  def city_air_indice

	array = []
	  
	url.each do |i|
	  page  = Nokogiri::HTML(open("#{i}")) 
      array << page.xpath('/html/body/main/section[1]/div[2]/div/div/div/div[1]/div[1]/a/div[1]/div[1]/div[1]/div[1]').text
    end
	return array
  end


  def define_alerte(a)

    if a.to_i > 80 
  	  return "#008B8B"
  	elsif a.to_i > 49 && a.to_i < 79
  	  return '#008B8B'
    else
  	  return "#008B8B"

    end

  end

def define_color_alerte(a)
	case a.to_i
	when 1..20
		return "#008B8B"
when 21..50 
	return "#006400"
	when 51..70
		return "#8B0000"
	end 
end

def city(a)
  page  = Nokogiri::HTML(open("https://www.atmosud.org/monair/commune/13055")) 
  puts page.xpath('/html/body/main/section[1]/div[2]/div/div/div/div[1]/div[1]/a/div[1]/div[1]/div[1]/div[1]').text

end

end
