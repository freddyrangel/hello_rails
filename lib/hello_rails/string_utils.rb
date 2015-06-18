module HelloRails
  module StringUtils
    def camelize(string)
      result = string.sub(/^[a-z\d]*/) { $&.capitalize }
      result.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }
    end

    def titleize(underscored_string)
      result = underscored_string.gsub(/_/, ' ')
      result.gsub(/\b('?[a-z])/) { $1.capitalize }
    end

    def dashize(string)
      string.gsub('_', '-')
    end

    def snake_case(string)
      string.gsub('-', '_')
    end
  end
end
