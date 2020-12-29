module ApplicationHelper
  def show_buddy_photo(buddy)
    photo = buddy.photos.first
      if photo
        cl_image_tag photo.key, :height => 300
      else
        image_tag('placeholder.jpg')
      end
  end
  
  def show_buddy_photo_small(buddy)
    if buddy.photos.first
       cl_image_tag buddy.photos.first.key, :width => 150, :height => 150, :crop => "scale", :class => "index-card-img"
    else
      image_tag('placeholder.jpg')
    end
  end

  def display_tag(tag)
    case tag
    when "Diplomatic"
      return "Will argue your case better than the best layer in town if you run into trouble"
    when "Shredded"
      return "Will intimidate anyone who want to pick a fight with you, don’t be afraid to dance alone!"
    when "Possessive"
      return "Will keep any interested party away from you. Your soulmate is safe!"
    when "Motherly"
      return "Will ensure you keep your clothes on. Manners first!"
    when "Comforting"
      return "Always a tissue in his pocket, don’t be afraid to cry!"
    when "Tough love"
      return "When you just need a wakeup call before calling your ex."
    when "Social"
      return "When you don’t want to look like you came alone on the next party"
    when "Memory"
      return "Will whisper you the name of people you don’t remember, don’t feel ashamed."
    when "Designated driver"
      return "will make sure to take you back home safe, give him your address and feel free to forget!"
    when "Wing Man"
      return "Someone that will help you get lucky, you will star in every circumstances!"
    end
  end

end
