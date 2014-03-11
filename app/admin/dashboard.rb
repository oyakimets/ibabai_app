ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        h3 "Submitted Promoacts"        
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
         panel "promo_id" do
           ul do
             Promoact.submitted.map do |pa|
               li pa.id 
             end
           end
         end
       end
       column do
         panel "name" do
           ul do
             Promoact.submitted.map do |pa|
               li link_to(pa.name, admin_promoact_path(pa))
             end
           end
         end
       end
       column do
         panel "start_date" do
           ul do
             Promoact.submitted.map do |pa|
               li pa.start_date.to_date
             end
           end
         end
       end
       column do
         panel "submit_date" do
           ul do
             Promoact.submitted.map do |pa|
               li pa.updated_at.to_date
             end
           end
         end
       end

      column do
         panel "Content tag" do
           ul do
             Promoact.submitted.map do |pa|
               li link_to(pa.cont_tag, pa.cont_tag_url)
             end
           end
         end
       end
       column do
         panel "Presentation" do
           ul do
             Promoact.submitted.map do |pa|
               li link_to(pa.cont_pres, pa.cont_pres_url)
             end
           end
         end
       end
       column do
         panel "Description" do
           ul do
             Promoact.submitted.map do |pa|
               li link_to(pa.cont_desc, pa.cont_desc_url)
             end
           end
         end
       end
     end
  end # content
end
