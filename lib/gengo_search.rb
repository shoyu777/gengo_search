require "gengo_search/version"
require 'csv'

module GengoSearch
  ERAS = CSV.read('lib/data/era_names.csv')

  def self.gengo
    ERAS.each do |en|
      puts en[0]
    end
  end

end
