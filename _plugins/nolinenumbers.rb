# frozen_string_literal: true

# noln is short for "no line numbers"

module Jekyll
  module Tags
    class NoLineNumbersBlock < Liquid::Block
      include Liquid::StandardFilters

      # The regular expression syntax checker. Start with the language specifier.
      # Follow that by zero or more space separated options that take one of three
      # forms: name, name=value, or name="<quoted list>"
      #
      # <quoted list> is a space-separated list of numbers
      SYNTAX = %r!^([a-zA-Z0-9.+#_-]+)((\s+\w+(=(\w+|"([0-9]+\s)*[0-9]+"))?)*)$!.freeze

      def initialize(tag_name, markup, tokens)
        super
        if markup.strip =~ SYNTAX
          @lang = Regexp.last_match(1).downcase
          #@highlight_options = parse_options(Regexp.last_match(2))
        else
          raise SyntaxError, <<~MSG
            Syntax Error in tag 'nohl' while parsing the following markup:

            #{markup}

            Valid syntax: nohl <lang>
          MSG
        end
      end

      LEADING_OR_TRAILING_LINE_TERMINATORS = %r!\A(\n|\r)+|(\n|\r)+\z!.freeze

      def render(context)
        prefix = context["highlighter_prefix"] || ""
        suffix = context["highlighter_suffix"] || ""
        code = super.to_s.gsub(LEADING_OR_TRAILING_LINE_TERMINATORS, "")

        output = render_codehighlighter(code)

        rendered_output = add_code_tag(output)
        prefix + rendered_output + suffix
      end

      private

      ## OPTIONS_REGEX = %r!(?:\w="[^"]*"|\w=\w|\w)+!.freeze

      def render_codehighlighter(code)
        h(code).strip
      end

      def add_code_tag(code)
        code_attributes = [
          "class=\"language-#{@lang.to_s.tr("+", "-")}\"",
          "class=\"nohljsln\"",
        ].join(" ")
        "<figure class=\"highlight\"><pre><code #{code_attributes}>"\
        "#{code.chomp}</code></pre></figure>"
      end
    end
  end
end

Liquid::Template.register_tag("noln", Jekyll::Tags::NoLineNumbersBlock)
