require "colorize"

module Cheatly
  class Renderer < Redcarpet::Render::Base
    def normal_text(text)
      text
    end

    def block_code(code, language)
      code
    end

    def codespan(code)
      block_code(code)
    end

    def header(title, level)
      sep = case level
      when 1 then '='
      when 2 then '+'
      when 3 then '-'
      end

      "#{title}\n#{sep * title.length}".bold
    end

    def double_emphasis(text)
      text.bold
    end

    def emphasis(text)
      text.underscore
    end

    def linebreak
      "\n"
    end

    def paragraph(text)
      text
    end

    def list(content, list_type)
     content
    end

    def list_item(content, list_type)
      " - #{content}\n"
    end

    def image(color, bg_color, text)
      text = text.colorize(color: color.to_sym)
      text = text.colorize(background: bg_color.to_sym) if bg_color

      text
    end
  end
end
