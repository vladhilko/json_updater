# frozen_string_literal: true

module JsonUpdater
  class JsonValidator
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def valid?
      file_exist? && json_valid?
    end

    def messages
      return "#{path} - file does't exist" unless file_exist?
      return "#{path} - json file doesn't valid" unless json_valid?
    end

    private

    def file_exist?
      File.exist? path
    end

    def json_valid?
      file = File.open(path).read
      JSON.parse(file)
      true
    rescue JSON::ParserError => _e
      false
    end
  end
end
