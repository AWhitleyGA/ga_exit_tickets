module ApplicationHelper

  def color_of input, options = {}
    # These are options that can optionally be passed in when the method is called
    greenest_possible_input = options[:green]
    reddest_possible_input  = options[:red]
    type_of_output          = options[:type]
    # HSL is a color method like RGB and CMYK. It stands for "Hue, Saturation, Lightness"
    # If h is 120 it's green; 240 is blue; 360 and 0 are red
    hsl_green_value = 120
    hsl_red_value   = 0
    if input.is_a? Numeric
      greenest_possible_input  ||= 10
      reddest_possible_input   ||= 2
    else # elsif input is a record, like submission, attendance, observation, etc
      greenest_possible_input  ||= (input.class.statuses.count - 1)
      reddest_possible_input   ||= 1
      input = input.read_attribute("status")
      input = nil if (input == 0)
    end
    return "" if (input.nil?)
    input_range = (greenest_possible_input - reddest_possible_input)
    input_as_percentage = (input - reddest_possible_input).to_f / (input_range)
    # How "green" is the input?
    hsl_color_value = hsl_green_value * input_as_percentage
    if hsl_color_value > hsl_green_value
      hsl_color_value = [hsl_color_value, hsl_green_value].min
    else # Makes sure the color doesn't go past green or red
      hsl_color_value = [hsl_color_value, hsl_red_value].max
    end
    hsl_string = "hsl(#{hsl_color_value}, 100%, 82%)"
    return hsl_color_value if (type_of_output === "int")
    return hsl_string if (type_of_output === "hsl_string")
    return "style='background-color:#{hsl_string};'".html_safe
  end

end
