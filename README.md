# SeoMetaTags

  This engine provide some interface for managing seo tags and not only.

  Seo tags it is title, meta description, meta keywords and image alt.

## Requirements

  Main page witch mount engine should include libraries such as:

  * jQuery
  * Coffee Script
  * rails ~> 4.0
  * haml-rails
  * will_paginate ~> 3.0

## Installation

```
gem "seo_meta_tags", git: 'https://github.com/stavskiys/seo_meta_tags.git'
```

## Usage

In main app inside `routes.rb` you should mount angine:
```
 mount SeoMetaTags::Engine => "/seo"
```

Default settings.

```
config = {
    layout: 'application',
    parent_controller_class: 'ApplicationController',
    include_helper: 'ApplicationHelper',
    error_partial: 'errors',
    store_filter_params: true,
    default_meta_data: {
      title: '',
      meta_description: '',
      meta_keywords: '',
      images_alt: ''
    }
  }
```

If you need redefine default settings create a init file `config/initializers/seo_meta_tags_init.rb`
```
SeoMetaTags.config = { ... }
```







