# frozen_string_literal: true

module JsonUpdater
  class JsonStructureUpdater
    attr_reader   :json_etalon
    attr_accessor :json_changeable

    def self.update_json(json_changeable, json_etalon)
      new(json_changeable, json_etalon).update_json
    end

    def initialize(json_changeable, json_etalon)
      @json_changeable = json_changeable
      @json_etalon     = json_etalon.dup
    end

    def update_json
      update_json_keys
    end

    private

    def update_json_keys
      json_etalon.each do |key, _value|
        json_etalon[key] = json_changeable[key] if json_changeable.key?(key)
      end
    end
  end
end
