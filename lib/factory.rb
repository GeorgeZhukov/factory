require "factory/version"

module Factory
  class Factory
    def self.new(*fields, &block)
      are_symbols = fields.inject(true) {|sum, item| sum &&= item.kind_of?(Symbol)}
      
      raise TypeError, 'Symbols expected' unless are_symbols

      instance = Class.new do
        define_method :initialize do |*instance_fields|
          @data = {}
          fields.each_with_index do |field, index|
            @data[field] = instance_fields[index]
          end
        end

        fields.each do |field|
          define_method field do
            @data[field]
          end
        end

        def to_s
          inspect
        end

        def to_h
          @data
        end

        def values
          @data.values
        end

        def eql?(other)
          other.kind_of?(self.class) && self.to_h == other.to_h
        end

        def each_pair(&block)
          if block_given?
            @data.each &block
            self
          else
            @data.each
          end
        end

        def values_at(*args)
          values.values_at *args
        end

        def each(&block)
          if block_given?
            values.each &block

            # Return current object for chain calculations
            # if block given
            self
          else
            values.each
          end
        end

        def members
          @data.keys
        end

        def select(&block)
          values.select &block
        end

        def size
          @data.size
        end

        alias_method :length, :size
        alias_method :to_a, :values
        alias_method :==, :eql?

        def [](key)
          case key
          when Symbol
            @data[key]
          when String
            @data[key.to_sym]
          when Integer
            data_array = @data.to_a
            if key < data_array.size
              data_array[key].last
            end
          end
        end

        def []=(key, value)
        end

      end

      # Add methods to class
      instance.class_eval &block if block_given?

      return instance
    end
  end
end
