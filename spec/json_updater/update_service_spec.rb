# frozen_string_literal: true

require 'spec_helper'

describe JsonUpdater::UpdateService do
  describe '#update_json' do
    context 'when json has one level structure' do
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

    context 'when json has one level array structure' do
      let(:base_path)           { 'spec/fixtures/one_level_array' }
      let(:changable_file_path) { "#{base_path}/one_level_array.json" }
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

    context 'when json has fields with one level hash structure' do
      let(:base_path)           { 'spec/fixtures/fields_with_one_level_hash' }
      let(:changable_file_path) { "#{base_path}/fields_with_one_level_hash.json" }
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

    context 'when json has fields with one level array of hash structure' do
      let(:base_path)           { 'spec/fixtures/fields_with_one_level_array_of_hash' }
      let(:changable_file_path) { "#{base_path}/fields_with_one_level_array_of_hash.json" }
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

    context 'when json has fields with multiple level of hash structure' do
      let(:base_path)           { 'spec/fixtures/fields_with_multiple_level' }
      let(:changable_file_path) { "#{base_path}/fields_with_multiple_level.json" }
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

    context 'when json has fields with multiple level of hash with array structure' do
      let(:base_path)           { 'spec/fixtures/fields_with_multiple_level_with_array' }
      let(:changable_file_path) { "#{base_path}/fields_with_multiple_level_with_array.json" }
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

    context 'when json has one field with array' do
      let(:base_path)           { 'spec/fixtures/one_field_with_array' }
      let(:changable_file_path) { "#{base_path}/one_field_with_array.json" }
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
end
