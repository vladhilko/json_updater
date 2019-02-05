# frozen_string_literal: true

require 'spec_helper'

describe JsonUpdater::UpdateService do
  describe '#update_json' do
    let(:base_path)           { 'spec/fixtures/one_level' }
    let(:changable_file_path) { "#{base_path}/one_level.json" }
    let(:temp_path)           { "#{base_path}/temp.json" }

    let!(:temp_file) { File.open(changable_file_path).read }

    before do
      File.open(temp_path, 'w') { |f| f.write(temp_file) }
    end

    after do
      File.delete(temp_path)
    end

    context 'when fields were added' do
      let(:etalon_file_path)    { "#{base_path}/add_fields/etalon.json" }
      let(:expected_file_path)  { "#{base_path}/add_fields/expected.json" }

      it 'adds addition fields to the json file' do
        described_class.update_json(temp_path, etalon_file_path)
        expect(File.open(temp_path).read).to eq File.open(expected_file_path).read.strip
      end
    end

    context 'when fields were removed' do
      let(:etalon_file_path)    { "#{base_path}/remove_fields/etalon.json" }
      let(:expected_file_path)  { "#{base_path}/remove_fields/expected.json" }

      it 'removes addition fields from the json file' do
        described_class.update_json(temp_path, etalon_file_path)
        expect(File.open(temp_path).read).to eq File.open(expected_file_path).read.strip
      end
    end

    context 'when fields were removed and were added' do
      let(:etalon_file_path)    { "#{base_path}/mixed_fields/etalon.json" }
      let(:expected_file_path)  { "#{base_path}/mixed_fields/expected.json" }

      it 'adds and removes addition fields from the json file' do
        described_class.update_json(temp_path, etalon_file_path)
        expect(File.open(temp_path).read).to eq File.open(expected_file_path).read.strip
      end
    end
  end
end
