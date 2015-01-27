module SeoMetaTags
  class Engine < ::Rails::Engine
    isolate_namespace SeoMetaTags

    initializer "seo_meta_tags.on_rails_init" do |app|
      ActionController::Base.send :include, SeoMetaTags::ApplicationControllerMethods
    end
  end
end
