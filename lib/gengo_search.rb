require "gengo_search/version"
require 'csv'

module GengoSearch
  attr_reader :kanji, :romaji
  ERAS = CSV.read('lib/data/era_names.csv')

  def self.gengo(year = nil, type = "kanji")
    if year.nil? then
      puts "please set a correct number(645~9999)"
    elsif year < 645 || year > 9999 then
      puts "please set a correct number(645~9999)"
    else
      if type == "kanji" then
        puts "漢字"
      else
        puts year.to_s
      end
    end
    #ERAS.each do |en|
    #  puts en["started_year"]
    #end
  end
end
