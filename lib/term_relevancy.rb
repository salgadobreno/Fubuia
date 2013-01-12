class TermRelevancy

  def initialize(text, words=[])
    @text = text
    @words = words
  end

  def rank
    result = []
    for matchthis in @words
      h = {frequency:0, tag:matchthis}

      @text.scan(Regexp.new(matchthis, Regexp::IGNORECASE)) do |match|
        h[:frequency] += 1
      end
      result << h
    end
    max = result.map { |e| e[:frequency]}.max
    result.each {|h|
      h[:relevancy] = if max == 0
                        0
                      else
                        h[:frequency].to_f / max
                      end
    }
    result
  end
end
