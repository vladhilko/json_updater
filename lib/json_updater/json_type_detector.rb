# frozen_string_literal: true

module JsonUpdater
  class JsonTypeDetector
    attr_reader :json_changeable

    def self.detect_type(json_changeable)
      new(json_changeable).detect_type
    end

    def initialize(json_changeable)
      @json_changeable = json_changeable
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
      json_changeable.is_a?(Hash)
    end

    def one_level_json_array?
      json_changeable.is_a?(Array)
    end
  end
end
