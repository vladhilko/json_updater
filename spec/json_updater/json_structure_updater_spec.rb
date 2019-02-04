require 'spec_helper'

describe JsonUpdater::JsonStructureUpdater do
  describe '#update_json' do
    let(:base_path)           { 'spec/fixtures/one_line' }
    let(:etalon_file_path)    { "#{base_path}/one_line_etalon.json" }
    let(:changable_file_path) { "#{base_path}/one_line.json" }
    let(:expected_file_path)  { "#{base_path}/expected_one_line.json" }
    let(:temp_path)           { "#{base_path}/temp.json" }

    let!(:temp_file) { File.open(changable_file_path).read }

    before do
      File.open(temp_path, 'w') { |f| f.write(temp_file) }
    end

    after do
      File.delete(temp_path)
    end

    it 'adds addition field to the json file' do
      described_class.update_json(temp_path, etalon_file_path)
      expect(File.open(expected_file_path).read.strip).to eq File.open(temp_path).read
    end
  end
end
