# frozen_string_literal: true

module JsonUpdater
  class JsonFullBuilder
    attr_reader :json_etalon, :json_changeble

    def self.build(json_changeble, json_etalon)
      new(json_changeble, json_etalon).build
    end

    def initialize(json_changeble, json_etalon)
      @json_changeble = json_changeble
      @json_etalon    = json_etalon
    end

    def build
      recursion_updation(json_changeble, json_etalon)
    end

    private

    def recursion_updation(mutation_json, inner_json_etalon)
      inner_json_etalon.each do |etalon_field_key, etalon_field_value|
        if hash_or_array?(etalon_field_value)
          mutation_json[etalon_field_key] = dive_inside(mutation_json[etalon_field_key], etalon_field_value)
        end
      end
      JsonTypeDetector.detect_type(mutation_json).build(mutation_json, inner_json_etalon)
    end

    def dive_inside(mutation_field_value, etalon_field_value)
      case etalon_field_value
      when Hash
        recursion_updation(mutation_field_value, etalon_field_value)
      when Array
        mutation_field_value.map { |hash| recursion_updation(hash, etalon_field_value.first) }
      end
    end

    # this method smells of :reek:UtilityFunction
    def hash_or_array?(etalon_field_value)
      [Hash, Array].include?(etalon_field_value.class)
    end
  end
end
