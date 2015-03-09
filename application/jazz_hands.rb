##
#  Jazz Hands for console and debugging
##
require 'jazz_hands'
require 'awesome_print'

JazzHands.colored_prompt = true
JazzHands.enable_syntax_highlighting_as_you_type!

Pry.config.print = ->(output, value) do
  return if JazzHands._hirb_output && Hirb::View.view_or_page_output(value)
  pretty = value.ai(indent: 2)
  Pry::Helpers::BaseHelpers.stagger_output("=> #{pretty}", output)
end

# Friendlier prompt - line number, app name, nesting levels look like
# directory paths.
#
# Heavy use of lazy lambdas so configuration (like Pry.color) can be
# changed later or even during console usage.
#
# Custom color helpers using hints \001 and \002 so that good readline
# libraries (GNU, rb-readline) correctly ignore color codes when
# calculating line length.

name = Storm::APP_NAME

color = -> { Pry.color && JazzHands.colored_prompt }
red  = ->(text) { color[] ? "\001\e[0;31m\002#{text}\001\e[0m\002" : text.to_s }
blue = ->(text) { color[] ? "\001\e[0;34m\002#{text}\001\e[0m\002" : text.to_s }
bold = ->(text) { color[] ? "\001\e[1m\002#{text}\001\e[0m\002"    : text.to_s }

separator = -> { red.(JazzHands.prompt_separator) }
colored_name = -> { blue.(name) }

line = ->(pry) { "[#{bold.(pry.input_array.size)}] " }
target_string = ->(object, level) do
  level = 0 if level < 0
  unless (string = Pry.view_clip(object)) == 'main'
    "(#{'../' * level}#{string})"
  else
    ''
  end
end

Pry.config.prompt = [
  ->(object, level, pry) do      # Main prompt
    "#{line.(pry)}#{colored_name.()}#{target_string.(object, level)} #{separator.()}  "
  end,
  ->(object, level, pry) do      # Wait prompt in multiline input
    spaces = ' ' * (
      "[#{pry.input_array.size}] ".size +  # Uncolored `line.(pry)`
      name.size +
      target_string.(object, level).size
    )
    "#{spaces} #{separator.()}  "
  end
]
