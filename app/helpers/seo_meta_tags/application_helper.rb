module SeoMetaTags
  module ApplicationHelper
    include SeoMetaTags.config[:include_helper].constantize if SeoMetaTags.config[:include_helper]

    def method_missing method, *args, &block
      str_method_name = method.to_s
      if str_method_name.end_with?('_path') || str_method_name.end_with?('_url') && main_app.respond_to?(method)
          main_app.send(method, *args)
      else
        super
      end
    end
  end
end
