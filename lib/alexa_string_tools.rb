require "alexa_string_tools/version"
require "humanize"

module AlexaStringTools
  def body_as_email
    string = spoken_string_to_email(self)
    string.strip
  end

  private

  def spoken_string_to_email(string)

    spoken_string_mapping.each do |from,to|
      string = string.gsub(from, to)
    end

    string.gsub(' ', '')
  end

  def spoken_string_mapping
    return if @spoken_string_mapping

    @spoken_string_mapping = {}

    # we don’t have to pad these with spaces because the results are crunched together in the end.
    ('A'..'Z').to_a.each do |letter|
      @spoken_string_mapping["#{letter}."] = letter
      @spoken_string_mapping["#{letter.downcase}."] = letter.downcase
    end

    # it’s okay to pad these with spaces, because they can’t be at the beginning or end anyway.
    @spoken_string_mapping.merge!({
      ' at ' => '@',
      ' dot ' => '.',
      ' period ' => '.',
      ' underscore ' => '_',
      ' plus ' => '+',
    })

    # spoken numbers are always converted into integers.
    (0..10000).to_a.reverse.each do |number|
      number_as_string = number.humanize
      number_as_string = number_as_string.gsub(/,/, '')
      number_as_string = number_as_string.gsub(/-/, ' ')
      @spoken_string_mapping[number_as_string] = number.to_s
    end

    @spoken_string_mapping
  end
end

String.class_eval do
  include AlexaStringTools
end
