module ApplicationHelper
  def show_buddy_photo(buddy)
    if buddy.photo.attached?
       cl_image_tag buddy.photo.key, :height => 300, :class => "card-img-top"
    else
      image_tag('placeholder.jpg')
    end
  end
end
