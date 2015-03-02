require 'mensurable/version'
require 'mensurable/magnitude'

module Mensurable
  include Comparable
  attr_reader :value, :unit_measure

  def * scale_factor
    self.class.new @value * scale_factor, @unit_measure
  end

  def / factor
    self.class.new @value / factor, @unit_measure
  end

  def + given_magnitude
    self.class.new value_in(given_magnitude.unit_measure) + given_magnitude.value, given_magnitude.unit_measure
  end

  def - given_magnitude
    self.class.new value_in(given_magnitude.unit_measure) - given_magnitude.value, given_magnitude.unit_measure
  end

  def <=> given_magnitude
    value_in(given_magnitude.unit_measure) <=> given_magnitude.value
  end

  def in given_unit_measure
    self.class.new value_in(given_unit_measure), given_unit_measure
  end

  def to_s
    "#{value.round(2)} #{unit_measure.to_s.gsub(/_/,' ')}"
  end

private
  def value_in given_unit_measure
    if @unit_measure == given_unit_measure.to_sym
      @value
    else
      @value * self.class.equivalences[@unit_measure.to_sym]/self.class.equivalences[given_unit_measure.to_sym]
    end
  end

  def method_missing(param)
    return self.in(param) if self.class.equivalences.has_key? param
    super param
  end  
end

class Numeric
  def method_missing(param)
    Mensurable::Magnitude.magnitude_measured_in(param).tap { |magnitude| return magnitude.new self, param unless magnitude.nil? }
    super param
  end
end
