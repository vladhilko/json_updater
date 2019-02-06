# frozen_string_literal: true

require 'json'

require 'json_updater/version'
require 'json_updater/one_level_json_builder'
require 'json_updater/one_level_json_array_builder'

require 'json_updater/json_structure_updater'
require 'json_updater/json_type_detector'

module JsonUpdater
  class UpdateService
    attr_reader :changable_file_path, :json_changeble, :json_etalon

    def self.update_json(changable_file_path, etalon_file_path)
      new(changable_file_path, etalon_file_path).update_json
    end

    def initialize(changable_file_path, etalon_file_path)
      @changable_file_path = changable_file_path

      @json_changeble = JSON.parse(File.open(changable_file_path).read)
      @json_etalon    = JSON.parse(File.open(etalon_file_path).read)
    end

    def update_json
      rewrite_file
    end

    private

    def rewrite_file
      File.open(changable_file_path, 'w') { |file| file.write(output_json) }
    end

    def output_json
      JSON.pretty_generate(recursion_updation)
    end

    def updated_json
      @updated_json ||= JsonTypeDetector.detect_type(json_changeble).build(json_changeble, json_etalon)
    end

    def recursion_updation
      json_etalon.each do |key, value|
        if value.is_a?(Hash)
          updated_json[key] = JsonTypeDetector.detect_type(updated_json[key]).build(updated_json[key], value)
        end
      end
      updated_json
    end

    def field_include_array?
    end

    def field_include_hash?
    end
  end
end
