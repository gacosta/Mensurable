class UnknownUnitMeasure < Exception; end

module Mensurable	
  class Magnitude
		@@registered_magnitudes = []

    def self.registered_magnitudes
      @@registered_magnitudes
    end

    def self.registered_unit_measures
      {}.tap { |result| registered_magnitudes.each {|magnitude| result[magnitude] = magnitude.equivalences.keys }}
    end

		def self.magnitude_measured_in(unit_measure)
      self.registered_magnitudes.each do |registered_magnitude|
        return registered_magnitude if registered_magnitude.equivalences.has_key? unit_measure
      end
		end

    def self.new(*measure_equivalences)
      measure_equivalences = measure_equivalences.flatten.first
      raise ArgumentError unless (measure_equivalences.kind_of?(Hash) && !measure_equivalences.empty?)

    	Class.new do |new_magnitude|
        include Mensurable
        @@registered_magnitudes << new_magnitude

        self.send :define_method, :initialize do |value, unit_measure|
          raise ArgumentError unless value.kind_of? Numeric
          raise UnknownUnitMeasure unless measure_equivalences.has_key? unit_measure.to_sym
          @value, @unit_measure = value, unit_measure.to_sym
        end

        self.instance_eval do
          @equivalences = measure_equivalences

          def equivalences
            @equivalences
          end

          def add_equivalences(new_equivalences)
            @equivalences.merge! new_equivalences
          end

          def unit_measures
            @equivalences.keys
          end
        end
      end
    end
	end
end