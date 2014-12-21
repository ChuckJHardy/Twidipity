class SuggestionDecorator < ApplicationDecorator
  def profile_image_uri
    super.gsub('_normal', '_200x200')
  end
end
