require 'json'

require "json_updater/version"
require "json_updater/json_structure_updater"

module JsonUpdater
  class UpdateService
    def self.update_json(changable_path, etalon_file_path)
      JsonStructureUpdater.update_json(changable_path, etalon_file_path)
    end
  end
end
