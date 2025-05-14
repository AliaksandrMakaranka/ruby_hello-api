class MessageService
  def self.get_default_message
    Message.default
  end

  def self.get_translated_message(language)
    Message.translate(Translations::DEFAULT_MESSAGE, language)
  end

  def self.create_message(content, language)
    Message.new(content, language)
  end
end 