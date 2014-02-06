require 'spec_helper'

describe "Promoact pages" do
	subject { page }

  	describe "promo action pages" do
  		let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) }      
    	
    	before do
            FactoryGirl.create(:brand, name: "Brand", user_id: user.id)
    		sign_in user
    		visit new_promoact_path
    	end

    	it { should have_content("Customer segments") }
    	it { should have_title("ibabai | new promo action") }
    end

    describe "promo status pages display" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:brand) { FactoryGirl.create(:brand) }
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "My promo1", brand_id: brand.id)
            FactoryGirl.create(:promoact, user: user, name: "My promo2", brand_id: brand.id, status: 2)
            FactoryGirl.create(:promoact, user: user, name: "My promo3", brand_id: brand.id, status: 3)
            FactoryGirl.create(:promoact, user: user, name: "My promo4", brand_id: brand.id, status: 4)
            FactoryGirl.create(:promoact, user: user, name: "My promo5", brand_id: brand.id, status: 5)
            FactoryGirl.create(:promoact, user: user, name: "My promo6", brand_id: brand.id, status: 6)      
            visit promoacts_path            
        end

        it { should have_content("My promo1") }
        it { should have_content("My promo6")}
        it { should have_content("Planned") }
        it { should have_content("Submitted") }
        it { should have_content("Declined") }
        it { should have_content("Approved") }
        it { should have_content("Running") }     
    end

    describe "promo action delete" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:brand) { FactoryGirl.create(:brand) }
        
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "My promo1", brand_id: brand.id)
            visit promoacts_path                      
        end

        it "should delete promo from db" do
            expect{ click_link("Delete") }.to change(Promoact, :count).by(-1)
            
        end
    end

    describe "promo action recall" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:brand) { FactoryGirl.create(:brand) }
        
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "My promo1", brand_id: brand.id, status: 2)
            visit promoacts_path
            click_link("Recall")                     
        end

        it { should have_content("Planned") }
        it { should_not have_content("Submitted") }        
    end

    describe "promo action details" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:brand) { FactoryGirl.create(:brand) }
        
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "My promo1", brand_id: brand.id, status: 6)
            visit promoacts_path            
            click_link("details")                                
        end

        it { should have_content("My promo1") }
        it { should have_title("ibabai | My promo1") }        
    end

    describe "drop promo action" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:brand) { FactoryGirl.create(:brand) }
        
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "My promo1", brand_id: brand.id, status: 6)
            visit promoacts_path
            click_link("drop")                     
        end

        it { should_not have_content("My promo1") }             
    end

    describe "create new promoaction" do

        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) } 
        let(:other_user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) }        
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "Promo1", status: 6)
            FactoryGirl.create(:promoact, user: other_user, name: "Promo2", status: 6, brand_id: 2)
            FactoryGirl.create(:brand, user: user, name: "Brand")
            FactoryGirl.create(:brand, user: user, name: "Brand1")
            FactoryGirl.create(:brand, user: other_user, name: "Brand2")                  
            FactoryGirl.create(:city, name: "City1")
            FactoryGirl.create(:city, name: "City2")
            FactoryGirl.create(:segment, user: user, name: "Segm1")
            FactoryGirl.create(:category, user: user, name: "Cat1")            
            FactoryGirl.create(:prodcat, name: "Prodcat1")
            FactoryGirl.create(:prodcat, name: "Prodcat2")
            FactoryGirl.create(:feedback, name: "Feedback1")
            FactoryGirl.create(:feedback, name: "Feedback2")           
            visit new_promoact_path                              
        end

        it { should have_content("Segm1") }
        it { should have_content("Cat1") }       

        let(:submit) { "Save promo" }

        describe "with invalid information" do
            it "should not create a promoact" do
                expect{ click_button submit }.not_to change(Promoact, :count)
            end
        end

        describe "with valid information" do
            before do               
                fill_in "promo name", with: "My promo"
                fill_in "start date", with: "2014-02-15"
                fill_in "end date", with: "2014-02-25"
                select "Brand", from: "brand"
                find("#cities_id").select("City1")
                find("#cities_id").select("City2")
                find("#segments_id_1").set(true)
                find("#categories_id_1").set(true)
                find("#prodcats_id").select("Prodcat1")
                find("#prodcats_id").select("Prodcat2")
                find("#brands_id").select("Brand1")
                find("#brands_id").select("Brand2")
                find("#past_promoacts_id").select("Promo1")
                find("#past_promoacts_id").select("Promo2")
                find("#feedbacks_id").select("Feedback1")
                find("#feedbacks_id").select("Feedback2")                  
            end                  
           

            it "should create new promo" do
                expect{ click_button submit }.to change(Promoact, :count).by(1)
            end

            it "should create promo-cities relations" do
                expect{ click_button submit }.to change(Promocity, :count).by(2)
            end

            it "should create promo-segments relations" do
                expect{ click_button submit }.to change(Promosegment, :count).by(1)
            end

            it "should create promo-cats relations" do
                expect{ click_button submit }.to change(Promocat, :count).by(1)
            end

            it "should create promo-prods relations" do
                expect{ click_button submit }.to change(Promoprod, :count).by(2)
            end

            it "should create promo-brands relations" do
                expect{ click_button submit }.to change(Promobrand, :count).by(2)
            end

            it "should create promo-past_promo relations" do
                expect{ click_button submit }.to change(Promorelation, :count).by(2)
            end

             it "should create promo-feedback relations" do
                expect{ click_button submit }.to change(Promofeedback, :count).by(2)
            end

            describe "when brand does not belong to client" do
                before { FactoryGirl.create(:brand, name: "brand3", user_id: 10, client_id: 2) }

                it { should_not have_selector("option", text: "brand3") }
                it { should have_selector("option", text: "Brand1") }
            end

            describe "when promo does not belong to client" do
                before do
                    FactoryGirl.create(:promoact, user_id: 10, client_id: 2, name: "Promo3", status: 6)
                end

                it { should_not have_selector("option", text: "Promo3") }
                it { should have_selector("option", text: "Promo1") }
            end

             describe "when promo is not completed" do
                before do
                    FactoryGirl.create(:promoact, user: user, name: "Promo4")
                end

                it { should_not have_selector("option", text: "Promo4") }
                
            end
        end
    end
    describe 'edit promotion' do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) }
        let(:brand) { FactoryGirl.create(:brand, user:user) }
        let(:promoact) { FactoryGirl.create(:promoact, user: user, brand_id: brand.id) }
        before do
            sign_in user
            FactoryGirl.create(:promoact, user: user, name: "Promo1", status: 6)           
            FactoryGirl.create(:brand, user: user, name: "Brand1")                              
            FactoryGirl.create(:city, name: "City1")            
            FactoryGirl.create(:segment, user: user, name: "Segm1")
            FactoryGirl.create(:category, user: user, name: "Cat1")            
            FactoryGirl.create(:prodcat, name: "Prodcat1")           
            FactoryGirl.create(:feedback, name: "Feedback1")                      
            visit edit_promoact_path(promoact)
        end

        describe "with invalid information" do
            let(:new_end_date) { "2014-01-01" }
            before do
                fill_in "end date", with: new_end_date
                click_button "Save promo"
            end

            it { should have_content('error') }
        end

        describe "with valid info" do
            let(:new_start_date) { "2014-03-01" }
            let(:new_end_date) { "2014-03-15" }
            before do
                fill_in "start date", with: new_start_date
                fill_in "end date", with: new_end_date                                  
                click_button "Save promo"
            end

            it "should update promo dates" do
                expect(promoact.reload.start_date).to eq new_start_date
                expect(promoact.reload.finish_date).to eq new_end_date
            end
        end

        describe "adding promo attributes" do
            let(:submit) { "Save promo" }
            before do
                find("#cities_id").select("City1")                
                find("#segments_id_1").set(true)
                find("#categories_id_1").set(true)
                find("#prodcats_id").select("Prodcat1")                
                find("#brands_id").select("Brand1")               
                find("#past_promoacts_id").select("Promo1")                
                find("#feedbacks_id").select("Feedback1")
            end

            it "should add promo-cities relations" do
                expect{ click_button submit }.to change(Promocity, :count).by(1)
            end

            it "should add promo-segments relations" do
                expect{ click_button submit }.to change(Promosegment, :count).by(1)
            end

            it "should add promo-cats relations" do
                expect{ click_button submit }.to change(Promocat, :count).by(1)
            end

            it "should add promo-prods relations" do
                expect{ click_button submit }.to change(Promoprod, :count).by(1)
            end

            it "should add promo-brands relations" do
                expect{ click_button submit }.to change(Promobrand, :count).by(1)
            end

            it "should add promo-past_promo relations" do
                expect{ click_button submit }.to change(Promorelation, :count).by(1)
            end

             it "should add promo-feedback relations" do
                expect{ click_button submit }.to change(Promofeedback, :count).by(1)
            end  
        end
    end

    describe "testing 'delete' functionality" do
        let(:user) { FactoryGirl.create(:user, account_id: 1, client_id: 1) }
        let(:brand) { FactoryGirl.create(:brand, user: user) }
        let(:promoact) { FactoryGirl.create(:promoact, user: user, brand_id: brand.id) }

        before { sign_in user }          
        

        describe "delete city" do
            let(:city) { FactoryGirl.create(:city) }
            before do
                promoact.promocities.create!(city_id: city.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete city from promo plan" do
                expect{ click_link "delete" }.to change(Promocity, :count).by(-1)
            end
        end

        describe "delete segment" do
            let(:segment) { FactoryGirl.create(:segment, user: user) }
            before do
                promoact.promosegments.create!(segment_id: segment.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete segment from promo plan" do
                expect{ click_link "delete" }.to change(Promosegment, :count).by(-1)
            end
        end

        describe "delete category" do
            let(:category) { FactoryGirl.create(:category, user: user) }
            before do
                promoact.promocats.create!(category_id: category.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete category from promo plan" do
                expect{ click_link "delete" }.to change(Promocat, :count).by(-1)
            end
        end

         describe "delete product category" do
            let(:prodcat) { FactoryGirl.create(:prodcat) }
            before do
                promoact.promoprods.create!(prodcat_id: prodcat.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete product category from promo plan" do
                expect{ click_link "delete" }.to change(Promoprod, :count).by(-1)
            end
        end

        describe "delete brand from feedback" do
            let(:brand) { FactoryGirl.create(:brand, user: user) }
            before do
                promoact.promobrands.create!(brand_id: brand.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete feedback brand from promo plan" do
                expect{ click_link "delete" }.to change(Promobrand, :count).by(-1)
            end
        end

        describe "delete past promo from feedback" do
            let(:past_promoact) { FactoryGirl.create(:promoact, user: user, brand_id: brand.id, status: 6) }            
            before do
                promoact.promorelations.create!(past_promoact_id: past_promoact.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete feedback promoact from promo plan" do
                expect{ click_link "delete" }.to change(Promorelation, :count).by(-1)
            end
        end

        describe "delete feedback attributes" do
            let(:feedback) { FactoryGirl.create(:feedback) }            
            before do
                promoact.promofeedbacks.create!(feedback_id: feedback.id)
                visit edit_promoact_path(promoact)                
            end

            it "should delete feedback attribute from promo plan" do
                expect{ click_link "delete" }.to change(Promofeedback, :count).by(-1)
            end
        end
    end
end