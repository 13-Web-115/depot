module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
<<<<<<< HEAD
	  attributes["style"] = "display: none"
	end
	content_tag("div", attributes, &block)
=======
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end
end
