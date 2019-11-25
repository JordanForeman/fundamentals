module Jekyll
    class Script < Liquid::Tag
      def initialize(tag_name, src, tokens)
        super
        @text = src.strip
      end
  
      def render(context)
        @jsRoot = context.registers[:site].config["js_dir"]
  
        "<script src=\"/#{@jsRoot}/#{@text}.js\"></script>"
      end
  
    end
  end
  
  Liquid::Template.register_tag('script', Jekyll::Script)