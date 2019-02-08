# frozen_string_literal: true

module JsonUpdater
  class OneLevelJsonArrayBuilder
    attr_reader :json_etalon, :json_changeable

    def self.build(json_changeable:, json_etalon:)
      new(json_changeable: json_changeable, json_etalon: json_etalon).build
    end

    def initialize(json_changeable:, json_etalon:)
      @json_changeable = json_changeable
      @json_etalon = json_etalon
    end

    def build
      json_changeable.map do |json_item|
        JsonStructureUpdater.update_json(json_changeable: json_item, json_etalon: json_etalon)
      end
    end
  end
end
