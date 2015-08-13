module SeoMetaTags
  module ApplicationControllerMethods
    extend ActiveSupport::Concern

    included do
      before_filter :page_seo_set
      helper_method :seo_set
    end

    def seo_set
      @seo_set
    end

    def page_seo_set
      return if params[:controller].include?(SeoMetaTags.config[:skip_seo_set_loading_if_controller_include])
      url = request.env["PATH_INFO"]

      seo_set_relation = SeoMetaTags::SeoSet.where(url: url)
      seo_set_relation = seo_set_relation.where(namespace: request.subdomain.to_s)
      @seo_set = seo_set_relation.first_or_initialize(SeoMetaTags.config[:default_meta_data])
    end
  end
end
