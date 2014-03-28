require "colorize"

module Cheatly
  class Renderer < Redcarpet::Render::Base
    def normal_text(text)
      text
    end

    def block_code(code, language = nil)
      code = code.each_line
      code = code.map { |l| "    #{l}" }
      "\n#{code.join}\n"
    end

    def codespan(code)
      "`#{code}`"
    end

    def header(title, level)
      sep =
        case level
        when 1 then '='
        when 2 then '+'
        when 3 then '-'
        else ''
        end

      "\n#{title.bold}\n#{(sep * title.length).bold}\n"
    end

    def double_emphasis(text)
      text.bold
    end

    def emphasis(text)
      text.underline
    end

    def paragraph(text)
      "#{text}\n"
    end

    def linebreak
      "\n"
    end

    def list(content, list_type)
     content
    end

    def list_item(content, list_type)
      lines = content.each_line
      lines = lines.map { |l| "   #{l}" }
      " - #{lines.join.strip}\n"
    end

    def image(color, bg_color, text)
      text = text.colorize(color: color.to_sym)
      text = text.colorize(background: bg_color.to_sym) if bg_color

      text
    end
  end
end
