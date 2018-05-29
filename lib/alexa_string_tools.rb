require "alexa_string_tools/version"
require "humanize"

module AlexaStringTools

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :mapping, :alexa_string_mapping

    def initialize
      @alexa_string_mapping = alexa_string_mapping
    end

    def alexa_string_mapping
      mapping = {}

      # we don’t have to pad these with spaces because the results are crunched together in the end.
      ('A'..'Z').to_a.each do |letter|
        mapping["#{letter}."] = letter
        mapping["#{letter.downcase}."] = letter.downcase
      end

      # spoken numbers are always converted into integers.
      (0..10000).to_a.reverse.each do |number|
        number_as_string = number.humanize
        number_as_string = number_as_string.gsub(/,/, '')
        number_as_string = number_as_string.gsub(/-/, ' ')
        mapping[number_as_string] = number.to_s
      end

      mapping
    end
  end

  def email_from_alexa
    raise_if_not_configured
    string = convert_from_alexa_string_to_email(self)
    string.strip
  end

  private

  def raise_if_not_configured
    if AlexaStringTools.configuration.nil?
      raise StandardError.new(
        "alexa_string_tools gem is't configured. \nRun rails g alexa_string_tools:install to fix it."
      )
    end
  end

  def convert_from_alexa_string_to_email(string)
    mapping = AlexaStringTools.configuration.alexa_string_mapping.merge(AlexaStringTools.configuration.mapping)
    mapping.each do |from,to|
      string = string.gsub(from, to)
    end

    string.gsub(' ', '')
  end

end

String.class_eval do
  include AlexaStringTools
end
