module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)                 #PR151
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
end
