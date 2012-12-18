module Kooaba

  class Item
    attr_accessor :title
    attr_accessor :metadata
    attr_accessor :enabled
    attr_accessor :reference_id
    attr_accessor :image_files

    def initialize(options = {})
      @title        = options[:title]
      @metadata     = options[:metadata]
      @enabled      = options[:enabled] || true
      @reference_id = options[:reference_id]
      @image_files  = options[:image_files] || []
    end
  end

end
