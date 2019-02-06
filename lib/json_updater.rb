# frozen_string_literal: true

require 'json'

require 'json_updater/version'
require 'json_updater/one_level_json_builder'
require 'json_updater/one_level_json_array_builder'

require 'json_updater/json_structure_updater'
require 'json_updater/json_type_detector'
require 'json_updater/json_validator'

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
      JSON.pretty_generate(recursion_updation(json_changeble, json_etalon))
    end

    def recursion_updation(mutation_json, inner_json_etalon)
      if etalon_not_include_hash?(inner_json_etalon)
        return JsonTypeDetector.detect_type(mutation_json).build(mutation_json, inner_json_etalon)
      end

      inner_json_etalon.each do |etalon_field_key, etalon_field_value|
        if etalon_field_value.is_a?(Hash)
          mutation_json[etalon_field_key] = recursion_updation(mutation_json[etalon_field_key], etalon_field_value)
        end
      end
      JsonTypeDetector.detect_type(mutation_json).build(mutation_json, inner_json_etalon)
    end

    def etalon_not_include_hash?(json)
      json.each { |_key, value| return false if value.is_a?(Hash) }
      true
    end
  end
end
