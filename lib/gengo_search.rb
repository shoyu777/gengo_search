require "gengo_search/version"
require 'csv'

module GengoSearch
  ERAS = CSV.read('lib/data/era_names.csv')

  def get(year = nil)
    if year > 0 || year <= 9999
      puts "number"
    else
      @kanji = "正しい西暦を入力してください"
      @romaji = "please set number"
    end
    #ERAS.each do |en|
    #  puts en["started_year"]
    #end
  end
end
