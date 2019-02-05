require 'spec_helper'

describe JsonUpdater::JsonTypeDetector do
  describe '#detect_type' do
    context 'when json has one_level structure' do
      let(:one_level_file_path) { 'spec/fixtures/one_level/one_level.json' }

      it 'returns OneLevelJsonBuilder' do
        expect(described_class.detect_type(one_level_file_path)).to eq JsonUpdater::OneLevelJsonBuilder
      end
    end

    context 'when json has one_level array structure' do
      let(:one_level_array_file_path) { 'spec/fixtures/one_level_array/one_level_array.json' }

      it 'returns OneLevelJsonArrayBuilder' do
        expect(described_class.detect_type(one_level_array_file_path)).to eq JsonUpdater::OneLevelJsonArrayBuilder
      end
    end
  end
end
