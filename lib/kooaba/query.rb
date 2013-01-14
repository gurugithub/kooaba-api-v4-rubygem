module Kooaba

  class Query
    attr_accessor :image_path
    attr_accessor :max_results
    attr_accessor :user_data

    def initialize(options = {})
      if options[:image_path] == nil || options[:image_path] == ""
        raise ArgumentError, "you need to provide the path of the query image"
      end

      @image_path  = options[:image_path]
      @max_results = options[:max_results] || 10
      @user_data   = options[:user_data]
    end
  end

end
