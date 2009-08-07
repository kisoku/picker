module Picker
  VERSION = '0.0.1'
end

module Sass::Script
  module Functions
    def base_color
      Sass::Script.parse($PICKER_BASE_COLOR, 1, 1, "PICKER_BASE_COLOR")
    end
  end
end
