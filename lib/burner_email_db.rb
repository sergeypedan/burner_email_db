# frozen_string_literal: true

require_relative "burner_email_db/version"

module BurnerEmailDB

  FILE_PATH = File.expand_path("../burner_email_db/db.txt", __FILE__).freeze

  def self.domains
    File.readlines(FILE_PATH).map(&:chomp)
  end

end
