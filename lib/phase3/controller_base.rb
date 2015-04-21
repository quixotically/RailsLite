require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    # cats_controller.render(:index)
    def render(template_name)
      path = "views/#{self.class.to_s.underscore}/#{template_name}.html.erb"
      contents = File.read(path)
      template = ERB.new(contents)
      result_to_render = template.result(binding)
      render_content(result_to_render, "text/html")
    end
  end
end
