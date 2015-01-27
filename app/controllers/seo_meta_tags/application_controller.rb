module SeoMetaTags
  class ApplicationController < SeoMetaTags.config[:parent_controller_class].constantize
  end
end
