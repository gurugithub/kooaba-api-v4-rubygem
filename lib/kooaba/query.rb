module Kooaba

  class Query
    attr_accessor :image_path
    attr_accessor :max_results
    attr_accessor :user_data

    def initialize(options = {})
      @image_path = options[:image_path]
      @max_results = options[:max_results]
      @user_data = options[:user_data]
    end
  end

end
