# frozen_string_literal: true

require 'spec_helper'

describe JsonUpdater::OneLevelJsonArrayBuilder do
  describe '#build' do
    let(:base_path)      { 'spec/fixtures/one_level_array' }
    let(:changable_file) { json_file("#{base_path}/one_level_array.json") }

    context 'when fields were added' do
      let(:etalon_file)    { json_file("#{base_path}/add_fields/etalon.json") }
      let(:expected_file)  { json_file("#{base_path}/add_fields/expected.json") }

      it 'adds addition fields to the json file' do
        expect(described_class.build(changable_file, etalon_file)).to eq expected_file
      end
    end

    context 'when fields were removed' do
      let(:etalon_file)    { json_file("#{base_path}/remove_fields/etalon.json") }
      let(:expected_file)  { json_file("#{base_path}/remove_fields/expected.json") }

      it 'removes addition fields from the json file' do
        expect(described_class.build(changable_file, etalon_file)).to eq expected_file
      end
    end

    context 'when fields were removed and were added' do
      let(:etalon_file)    { json_file("#{base_path}/mixed_fields/etalon.json") }
      let(:expected_file)  { json_file("#{base_path}/mixed_fields/expected.json") }

      it 'adds and removes addition fields from the json file' do
        expect(described_class.build(changable_file, etalon_file)).to eq expected_file
      end
    end
  end
end
