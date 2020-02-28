require'slackHtmlToMarkdown/version'

module SlackHtmlToMarkdown
  class Error < StandardError; end

  class Parser
    def self.to_markdown(html)
      html.gsub!('<strong>', '*')
      html.gsub!('</strong>', '*')
      html.gsub!('<em>', '_')
      html.gsub!('</em>', '_')
      html.gsub!('<stike>', '~')
      html.gsub!('</strike>', '~')
      parse_link(html)
    end

    def self.parse_link(html)
      html.gsub!(/<a href="(?'link'[^"]*)">(?<text>[^<]*)<\/a>/) do
        "<#{$~[:link]}|#{$~[:text]}>"
      end
      html
    end
  end
end
