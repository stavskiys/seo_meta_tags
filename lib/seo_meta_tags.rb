require "seo_meta_tags/application_controller_methods"
require "seo_meta_tags/engine"

module SeoMetaTags

  mattr_accessor :config

  self.config = {
    layout: 'application',
    parent_controller_class: 'ApplicationController',
    include_helper: 'ApplicationHelper',
    error_partial: 'errors',
    store_filter_params: true,
    table_name: 'seo_meta_tags_seo_sets',
    skip_seo_set_loading_if_controller_include: '/admin',
    default_meta_data: {
      title: '',
      description: '',
      keywords: '',
      images_alt: ''
    }
  }

end
