module JsonUpdater
  class OneLevelJsonBuilder
    def self.build(json_changeble, json_etalon)
      JsonStructureUpdater.update_json(json_changeble, json_etalon)
    end
  end
end
