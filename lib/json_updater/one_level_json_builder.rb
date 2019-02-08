# frozen_string_literal: true

module JsonUpdater
  class OneLevelJsonBuilder
    def self.build(json_changeable:, json_etalon:)
      JsonStructureUpdater.update_json(json_changeable: json_changeable, json_etalon: json_etalon)
    end
  end
end
