module JsonUpdater
  class JsonStructureUpdater
    attr_reader :json_etalon, :changable_file_path
    attr_accessor :json_changeble

    def self.update_json(changable_file_path, etalon_file_path)
      new(changable_file_path, etalon_file_path).update_json
    end

    def initialize(changable_file_path, etalon_file_path)
      @changable_file_path = changable_file_path

      @json_changeble = JSON.parse(File.open(changable_file_path).read)
      @json_etalon    = JSON.parse(File.open(etalon_file_path).read)
    end

    def update_json
      update_json_keys
      rewrite_file
    end

    private

    def update_json_keys
      keys_difference.each { |new_field| json_changeble[new_field] = nil }
    end

    def keys_difference
      json_etalon.keys - json_changeble.keys
    end

    def rewrite_file
      File.open(changable_file_path, 'w') { |f| f.write(output_json) }
    end

    def output_json
      JSON.pretty_generate(json_changeble)
    end
  end
end
