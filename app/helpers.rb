require 'active_support/number_helper'
require 'redcarpet'

module Sinatra
  module RenderMarkdownHelper
    def md(markdown)
      (@renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)).render(markdown)
    end
  end
  module SchmoneyHelper
    def cashify(amount)
      ActiveSupport::NumberHelper.number_to_currency amount
    end
  end
  module IIHelper
    def render_ii(shipment, field, emoji, description, representation=nil)
      return unless shipment[field]
      "<br/><abbr title='#{description}'>#{emoji}</abbr>: #{representation&.call(shipment) || shipment[field]}"
    end
  end
end