module ReviewsHelper
  def approval_status(review)
    return 'Published' if review.approved
    'Not Approved'
  end

  def masked_name_for(review)
    content_tag :i do 
      "#{review.first_name} #{review.last_name[0]}."
    end
  end
end
