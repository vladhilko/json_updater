module JsonUpdater
  class JsonTypeDetector
    attr_reader :json_changeble

    def self.detect_type(changable_file_path)
      new(changable_file_path).detect_type
    end

    def initialize(changable_file_path)
      @json_changeble = JSON.parse(File.open(changable_file_path).read)
    end

    def detect_type
      case
      when is_one_level_json?
        JsonUpdater::OneLevelJsonBuilder
      when is_one_level_json_array?
        JsonUpdater::OneLevelJsonArrayBuilder
      end
    end

    private

    def is_one_level_json?
      json_changeble.is_a?(Hash)
    end

    def is_one_level_json_array?
      json_changeble.is_a?(Array)
    end
  end
end
