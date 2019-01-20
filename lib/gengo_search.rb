require "gengo_search/version"
require 'csv'

module GengoSearch
  class Gengo
    attr_reader :kanji, :romaji, :hiragana, :year
    ERAS = CSV.read('lib/data/era_names.csv')

    def initialize(ad_year = nil)
      if ad_year.nil? || !(ad_year.is_a?(Integer)) || ad_year < 645 || ad_year > 9999 then
        raise ArgumentError, "Please set a correct number(645~9999)"
      else
        started_year_index = search(ad_year)
        setTargetEra(started_year_index, ad_year)
      end
    end

    #Using Binary Search
    def search(target = 0)

      head = 0
      tail = ERAS.count - 1

      if ERAS[tail][0].to_i <= target then
        return tail
      else
        while head <= tail

          center = (head + tail) / 2
  
          if ERAS[center][0].to_i <= target && target < ERAS[center + 1][0].to_i then
            return center
          elsif ERAS[center][0].to_i < target
            head = center + 1
          else
            tail = center - 1
          end
        end
      end


    end

    def setTargetEra(started_year_index = 0, ad_year = 0)
      year = ad_year - ERAS[started_year_index][0].to_i + 1
      if year == 1 then
        @kanji = "#{ERAS[started_year_index][1]} 元年"
        @hiragana = "#{ERAS[started_year_index][3]} がんねん"
        @romaji = "#{ERAS[started_year_index][2]} GANNEN"
      else
        @kanji = "#{ERAS[started_year_index][1]} #{year}年"
        @romaji = "#{ERAS[started_year_index][2]} #{year}NEN"
        @hiragana = "#{ERAS[started_year_index][3]} #{year}ねん"
      end
    end

  end
end
