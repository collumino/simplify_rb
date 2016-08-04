require 'simplify_rb/symbolize'

module SimplifyRb
  class Point

    attr_reader :dist, :ele, :time
    attr_accessor :keep

    def initialize(raw_hsh)
      @dist = raw_hsh[:dist]
      @ele = raw_hsh[:ele]
      @time = raw_hsh[:time]
    end

    def x
      @dist
    end

    def y
      @ele
    end

    def get_sq_dist_to(other_point)
      dx = x - other_point.x
      dy = y - other_point.y

      dx * dx + dy * dy
    end
  end
end
