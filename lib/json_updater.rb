require "json_updater/version"
require "json_updater/json_structure_updater"

module JsonUpdater
  class UpdateService
    def self.update_json(etalon_file_path, changable_path)
      JsonStructureUpdater.update_json(etalon_file_path, changable_path)
    end
  end
end
