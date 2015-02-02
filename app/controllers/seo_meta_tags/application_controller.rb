module SeoMetaTags
  class ApplicationController < SeoMetaTags.config[:parent_controller_class].constantize

    helper_method :page_filter

    private

    def page_filter
      return params[:filter] || {} unless SeoMetaTags.config[:store_filter_params]

      if params[:filter]
        session[:filter] = { controller_action_key => params[:filter] }
      end
      session[:filter] = { controller_action_key => { } } if params[:reset_filter] || session[:filter].nil?

      session[:filter][controller_action_key].symbolize_keys
    end

    def controller_action_key
      controller_action_key = "#{params[:controller]}_#{params[:action]}"
    end

  end
end
