require "seo_meta_tags/application_controller_methods"
require "seo_meta_tags/engine"

module SeoMetaTags

  mattr_accessor :config

  self.config = {
    layout: 'application',
    parent_controller_class: 'ApplicationController',
    include_helper: 'ApplicationHelper',
    default_meta_data: {
      title: '',
      meta_description: '',
      meta_keywords: '',
      images_alt: ''
    }
  }

end
