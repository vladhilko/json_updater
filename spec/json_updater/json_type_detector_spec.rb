# frozen_string_literal: true

require 'spec_helper'

describe JsonUpdater::JsonTypeDetector do
  describe '#detect_type' do
    context 'when json has one_level structure' do
      let(:one_level_file_path) { 'spec/fixtures/one_level/one_level.json' }
      let(:one_level_json) { json_file(one_level_file_path) }

      it 'returns OneLevelJsonBuilder' do
        expect(described_class.detect_type(one_level_json)).to eq JsonUpdater::OneLevelJsonBuilder
      end
    end

    context 'when json has one_level array structure' do
      let(:one_level_array_file_path) { 'spec/fixtures/one_level_array/one_level_array.json' }
      let(:one_level_json_array) { json_file(one_level_array_file_path) }

      it 'returns OneLevelJsonArrayBuilder' do
        expect(described_class.detect_type(one_level_json_array)).to eq JsonUpdater::OneLevelJsonArrayBuilder
      end
    end
  end
end
