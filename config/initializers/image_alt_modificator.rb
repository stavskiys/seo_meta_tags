module ActionView::Helpers::AssetTagHelper

  alias :native_image_alt :image_alt

  def image_alt(src)
    if seo_set.nil? || seo_set.images_alt.blank?
      native_image_alt(src)
    else
      filename = src.split('/').last.split('?').first.split('.').first
      seo_set.images_alt[filename].blank? ? native_image_alt(src) : seo_set.images_alt[filename]
    end
  end
end

