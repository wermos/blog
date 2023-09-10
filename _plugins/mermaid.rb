module Jekyll
  module Tags
    class MermaidBlock < Liquid::Block
      include Liquid::StandardFilters

      def initialize(tag_name, markup, tokens)
        super
      end

      def render(context)
        mermaid_code = super.to_s

        "<div class=\"mermaid mermaid-config\">"\
        "#{mermaid_code.chomp}</div>"
      end

      private
    end
  end
end

Liquid::Template.register_tag("mermaid", Jekyll::Tags::MermaidBlock)
