require 'json'

require "json_updater/version"
require "json_updater/one_level_json_builder"
require "json_updater/one_level_json_array_builder"

require "json_updater/json_structure_updater"
require "json_updater/json_type_detector"


module JsonUpdater
  class UpdateService
    def self.update_json(changable_path, etalon_file_path)
      JsonStructureUpdater.update_json(changable_path, etalon_file_path)
    end
  end
end
