# frozen_string_literal: true

module JsonUpdater
  class JsonValidator
    attr_reader :path

    def initialize(path)
      @path = path
      @messages = []
    end

    def valid?
      file_exist? && json_valid?
    end

    def messages
      @messages << "#{path} - file does't exist" unless file_exist?
      @messages << "#{path} - json file doesn't valid" unless json_valid?
      @messages.join(', ')
    end

    private

    def file_exist?
      File.exist? path
    end

    def json_valid?
      begin
        JSON.parse(path)
        true
      rescue JSON::ParserError => _e
        false
      end
    end
  end
end
