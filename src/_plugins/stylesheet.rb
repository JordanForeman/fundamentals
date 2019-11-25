module Jekyll
    class Stylesheet < Liquid::Tag
      def initialize(tag_name, href, tokens)
        super
        @text = href.strip
      end
  
      def render(context)
        @cssRoot = context.registers[:site].config["css_dir"]
  
        "<link rel=\"stylesheet\" href=\"/#{@cssRoot}/#{@text}.css\">"
      end
  
    end
  end
  
  Liquid::Template.register_tag('stylesheet', Jekyll::Stylesheet)