# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  # Flash Helper
  def flash_display
    response = ""
    flash.each do |name, msg|
      response = response + content_tag(:div, msg, :id => "flash_#{name}")
    end
    response.insert(0, "<i class='icon-remove pull-right' id='flash-exit'></i>" )
    flash.discard
    response
  end
  
end
