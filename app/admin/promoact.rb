ActiveAdmin.register Promoact do
  scope :submitted
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :status
  
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do
    column :status
    column :id
    column :name
    column :start_date
    column :updated_at
    column :user_id
    column :client_id
    column :cont_tag do |promoact|
      if !promoact.cont_tag.blank?
        link_to "View", promoact.cont_tag_url
      end
    end
    column :cont_pres do |promoact|
      if !promoact.cont_pres.blank?
        link_to "View", promoact.cont_pres_url
      end
    end
    column :cont_desc do |promoact|
      if !promoact.cont_desc_url.blank?
        link_to "View", promoact.cont_desc_url
      end
    end
    column :dropped
    default_actions
  end  
end
