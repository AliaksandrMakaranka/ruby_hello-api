require_relative '../constants/translations'

class Message
  attr_reader :content, :language

  def initialize(content, language = 'en')
    @content = content
    @language = language
  end

  def to_h
    {
      content: @content,
      language: @language,
      timestamp: Time.now.iso8601
    }
  end

  def to_json
    to_h.to_json
  end

  def self.default
    new(Translations::DEFAULT_MESSAGE)
  end

  def self.translate(content, language)
    translated_content = Translations::TRANSLATIONS[language] || content
    new(translated_content, language)
  end
end 