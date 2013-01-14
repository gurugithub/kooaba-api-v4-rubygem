module Kooaba

  class Item

    attr_accessor :uuid
    attr_accessor :images_sha1

    attr_accessor :title
    attr_accessor :metadata
    attr_accessor :enabled
    attr_accessor :reference_id
    attr_accessor :image_files

    def initialize(options = {})
      raise TypeError, "enabled should be true or false" unless [nil, true, false].include? options[:enabled]
      if !options[:image_files].instance_of?(Array) && options[:image_files] != nil
        raise TypeError, "image_files must be a list of paths (Array of Strings)"
      end

      @title        = options[:title]
      @metadata     = options[:metadata]
      @enabled      = options[:enabled] == nil ? true : options[:enabled]
      @reference_id = options[:reference_id]
      @image_files  = options[:image_files] || []
    end
  end

end
