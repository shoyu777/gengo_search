RSpec.describe GengoSearch do
  it "has a version number" do
    expect(GengoSearch::VERSION).not_to be nil
  end

  context "Normal Case" do
    it "Normal Case" do
      keioGannen = GengoSearch::Gengo.new(1866)
      kanjiResult = "慶応 2年"
      romajiResult = "KEIO 2NEN"
      hiraganaResult = "けいおう 2ねん"
      expect(keioGannen.kanji).to eq(kanjiResult)
      expect(keioGannen.romaji).to eq(romajiResult)
      expect(keioGannen.hiragana).to eq(hiraganaResult)
    end

    it "First Year of the Era (GANNEN)" do
      keioGannen = GengoSearch::Gengo.new(1865)
      kanjiResult = "慶応 元年"
      romajiResult = "KEIO GANNEN"
      hiraganaResult = "けいおう がんねん"
      expect(keioGannen.kanji).to eq(kanjiResult)
      expect(keioGannen.romaji).to eq(romajiResult)
      expect(keioGannen.hiragana).to eq(hiraganaResult)
    end

    it "New Gengo Reiwa" do
      reiwaGannen = GengoSearch::Gengo.new(2019)
      kanjiResult = "令和 元年"
      romajiResult = "REIWA GANNEN"
      hiraganaResult = "れいわ がんねん"
      expect(reiwaGannen.kanji).to eq(kanjiResult)
      expect(reiwaGannen.romaji).to eq(romajiResult)
      expect(reiwaGannen.hiragana).to eq(hiraganaResult)
    end


  end

  context "Argument Error case" do
    it "Null Argument" do
      expect{GengoSearch::Gengo.new()}.to raise_error(ArgumentError, "Please set a correct number(645~9999)")
    end

    it "Less than 645" do
      expect{GengoSearch::Gengo.new(644)}.to raise_error(ArgumentError, "Please set a correct number(645~9999)")
    end

    it "More than 9999" do
      expect{GengoSearch::Gengo.new(10000)}.to raise_error(ArgumentError, "Please set a correct number(645~9999)")
    end

    it "Not Integer(float)" do
      expect{GengoSearch::Gengo.new(100.5)}.to raise_error(ArgumentError, "Please set a correct number(645~9999)")
    end

    it "Not Integer(text)" do
      expect{GengoSearch::Gengo.new('abc')}.to raise_error(ArgumentError, "Please set a correct number(645~9999)")
    end

  end

end
