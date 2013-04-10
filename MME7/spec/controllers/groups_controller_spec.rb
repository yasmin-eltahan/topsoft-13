require 'spec_helper'

describe GroupsController  do

	def valid_attributes
   		 {:group_name => "groupOne", :description => "blaaaah blaah", :levels => "parent"}
 	end

 	def invalid_attributes
 		{:group_name => "",:description => "", :levels => ""}
 	end

  def update_attributes
    {:group_name => "groupOneOne", :description => "blaaaah blaah haaa", :levels => "child"}
  end


	describe "GET edit" do
   		 it "assigns the requested group as @group" do
  			 group  = Group.create! valid_attributes
       		 get :edit, {:id => group.to_param}
       		 assigns(:group).should eq(group)
   		 end
  end

    describe "PUT update" do
            describe "with valid params" do
                it "updates the requested group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :group => update_attributes }
                end

                it "assigns the requested group as @group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :group => valid_attributes}
                    assigns(:group).should eq(group)
                end

                it "redirects to the group" do
                    group = Group.create! valid_attributes
                    put :update, {:id => group.to_param, :@group => valid_attributes}
                    response.should redirect_to( 'http://test.host/groups')
                end

            end

            describe "with invalid params" do
                it "assigns the group as @group" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    assigns(:group).should eq(group)
                end
                it "re-renders the 'edit' template" do
                    group = Group.create! valid_attributes
                    # Trigger the behavior that occurs when invalid params are submitted
                    Group.any_instance.stub(:save).and_return(false)
                    put :update, {:id => group.to_param, :group => invalid_attributes}
                    response.should render_template(:action => "edit")
                end
            end
    end



end