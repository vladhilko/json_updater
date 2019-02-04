require 'spec_helper'

describe JsonUpdater::UpdateService do
  describe '#update_json' do
    before do
      allow(JsonUpdater::JsonStructureUpdater).to receive(:update_json)
    end

    it 'runs JsonStructureUpdater' do
      expect(JsonUpdater::JsonStructureUpdater).to receive(:update_json).exactly(1).times
      described_class.update_json({}, {})
    end
  end
end
