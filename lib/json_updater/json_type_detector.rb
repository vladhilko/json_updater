# frozen_string_literal: true

module JsonUpdater
  class JsonTypeDetector
    attr_reader :json_changeble

    def self.detect_type(json_changeble)
      new(json_changeble).detect_type
    end

    def initialize(json_changeble)
      @json_changeble = json_changeble
    end

    def detect_type
      if one_level_json?
        JsonUpdater::OneLevelJsonBuilder
      elsif one_level_json_array?
        JsonUpdater::OneLevelJsonArrayBuilder
      end
    end

    private

    def one_level_json?
      json_changeble.is_a?(Hash)
    end

    def one_level_json_array?
      json_changeble.is_a?(Array)
    end
  end
end
