# frozen_string_literal: true

require 'spec_helper'
require 'shared_examples/json_updater_shared_spec'

describe JsonUpdater::UpdateService do
  describe '#update_json' do
    include_examples 'json updater', 'one_level'
    include_examples 'json updater', 'one_level_array'
    include_examples 'json updater', 'fields_with_one_level_hash'
    include_examples 'json updater', 'fields_with_one_level_array_of_hash'
    include_examples 'json updater', 'fields_with_multiple_level'
    include_examples 'json updater', 'fields_with_multiple_level_with_array'
    include_examples 'json updater', 'one_field_with_array'
  end
end
