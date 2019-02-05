# frozen_string_literal: true

module Helpers
  def json_file(path)
    JSON.parse(File.open(path).read)
  end
end
