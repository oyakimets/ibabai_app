ActiveAdmin.register User do
  scope :accounts
 

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email, :password, :password_confirmation, :tel1, :tel2, :client_id, :admin, :account_id 

  controller do
    
  end

  index do
    column :id
    column :name
    column :email
    column :tel1
    column :tel2
    column :client_id
    column :account_id
    column :admin
    default_actions
  end  
  
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
