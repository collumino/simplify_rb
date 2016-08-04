require 'simplify_rb/version'
require 'simplify_rb/point'
require 'simplify_rb/radial_distance_simplifier'
require 'simplify_rb/douglas_peucker_simplifier'

module SimplifyRb
  class Simplifier
    def process(raw_points, tolerance = 1, highest_quality = false)
      raise ArgumentError.new('Points must be an array') unless raw_points.is_a? Array

      return raw_points if raw_points.length <= 1

      sq_tolerance = tolerance * tolerance

      points = raw_points.map { |p| Point.new(p) }

      unless highest_quality
        points = RadialDistanceSimplifier.new.process(points, sq_tolerance)
      end

      DouglasPeuckerSimplifier.new.process(points, sq_tolerance)
    end
  end
end
