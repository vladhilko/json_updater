module JsonUpdater
  class OneLevelJsonArrayBuilder
    attr_reader   :json_etalon
    attr_accessor :json_changeble

    def self.build(json_changeble, json_etalon)
      new(json_changeble, json_etalon).build
    end

    def initialize(json_changeble, json_etalon)
      @json_changeble = json_changeble
      @json_etalon    = json_etalon
    end

    def build
      json_changeble.map do |json_item|
        JsonStructureUpdater.update_json(json_item, json_etalon)
      end
    end
  end
end
