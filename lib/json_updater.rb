# frozen_string_literal: true

require 'json'

require 'json_updater/version'
require 'json_updater/one_level_json_builder'
require 'json_updater/one_level_json_array_builder'
require 'json_updater/json_full_builder'

require 'json_updater/json_structure_updater'
require 'json_updater/json_type_detector'
require 'json_updater/json_validator'

module JsonUpdater
  class UpdateService
    attr_reader :changeable_file_path, :json_changeable, :json_etalon

    def self.update_json(changeable_file_path:, etalon_file_path:)
      new(changeable_file_path: changeable_file_path, etalon_file_path: etalon_file_path).update_json
    end

    def initialize(changeable_file_path:, etalon_file_path:)
      @changeable_file_path = changeable_file_path

      @json_changeable = JSON.parse(File.open(changeable_file_path).read)
      @json_etalon = JSON.parse(File.open(etalon_file_path).read)
    end

    def update_json
      rewrite_file
    end

    private

    def rewrite_file
      File.open(changeable_file_path, 'w') { |file| file.write(output_json) }
    end

    def output_json
      JSON.pretty_generate(updated_json)
    end

    def updated_json
      JsonUpdater::JsonFullBuilder.build(json_changeable: json_changeable, json_etalon: json_etalon)
    end
  end
end
