# frozen_string_literal: true

module Helpers
  class FileReader
    def self.read(path)
      puts path
      unless File.exist?(path)
        warn "Input file not found: #{path}"
        return ''
      end

      File.read(path)
    end
  end
end
