module JsonUpdater
  class JsonStructureUpdater
    attr_accessor :json_changeable, :json_etalon

    def self.update_json(json_changeable, json_etalon)
      new(json_changeable, json_etalon).update_json
    end

    def initialize(json_changeable, json_etalon)
      @json_changeable = json_changeable
      @json_etalon    = json_etalon
    end

    def update_json
      update_json_keys
    end

    private

    def update_json_keys
      json_etalon.each do |key, value|
        json_etalon[key] = json_changeable[key] if json_changeable.has_key?(key)
      end
    end
  end
end
