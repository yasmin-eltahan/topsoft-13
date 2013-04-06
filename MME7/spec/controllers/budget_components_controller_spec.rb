require 'spec_helper'

# describe BudgetComponentsController do


# 	 # describe "GET #index" do
#   #   it "responds successfully with an HTTP 200 status code" do
#   #     get :index
#   #     expect(response).to be_success
#   #     expect(response.code).to eq(200)
#   #   end

#   #   it "renders the index template" do
#   #     get :index
#   #     expect(response).to render_template("index")
#   #   end

#   #   it "loads all of the budget components of a certain budget item into @components" do
#   #     component1, component2 = BudgetComponent.create!, BudgetComponent.create!
#   #     get :index

#   #     expect(assigns(:components)).to match_array([component1, component2])
#   #   end
#   # end

#   # UPDATE
#     describe "PUT birds/:id" do
#     describe "with valid params" do

#       before(:each) do
#       @budget_component = mock_model(BudgetComponent, :update_attributes => true)
#       BudgetComponent.stub!(:find).with("49").and_return(@budget_component)
#         # @budget_item = mock_model(BudgetItem, :update_attributes => true)
#         # BudgetItem.stub!(:find).with("1").and_return(@budget_item)
#       end
#       it "should find budget component and return object" do
#       BudgetComponent.should_receive(:find).with("49").and_return(@budget_component)
#       put :update, :id => "49", :budget_component => {}
#       end
#         # it "should find budget item and return object" do
#         # BudgetItem.should_receive(:find).with("1").and_return(@budget_item)
#         # put :update, :id => "1", :budget_item => {}
#         # end
#       it "should update the component object's attributes" do
#       @budget_component.should_receive(:update_attributes).and_return(true)
#       put :update, :id => "49", :budget_component  => {}
#       end
#         # it "should update the item object's attributes" do
#         # @budget_item.should_receive(:update_attributes).and_return(true)
#         # put :update, :id => "1", :budget_item  => {}
#         # end
#       it "should have a flash notice" do
#       put :update, :id => "49", :budget_component  => {}
#       flash[:notice].should eql 'Component was successfully updated.'
#       end
#       it "should redirect to the component's list page" do
#       put :update, :id => "49", :budget_component => {}
#       response.should redirect_to(budget_component_url(@budget_componet))
#       end

    
#     end
    
#     describe "with invalid params" do

#       before(:each) do
#       @budget_component = mock_model(BudgetComponent, :update_attributes => false)
#       BudgetComponent.stub!(:find).with("49").and_return(@budget_component)
#       end

#       it "should find budget component and return object" do
#       BudgetComponent.should_receive(:find).with("49").and_return(@budget_component)
#       put :update, :id => "49", :budget_component => {}
#       end

#       it "should update the component object's attributes" do
#       @budget_component.should_receive(:update_attributes).and_return(false)
#       put :update, :id => "49", :budget_component => {}
#       end

#       it "should render the edit form" do
#       put :update, :id => "49", :budget_component => {}
#       response.should render_template('edit')
#       end

#       it "should have a flash notice" do
#       flash[:notice].should_not be_blank
#       end
    
#     end
#   end

# end
<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do

  # This should return the minimal set of attributes required to create a valid
  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    <%= formatted_hash(example_valid_attributes) %>
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # <%= controller_class_name %>Controller. Be sure to keep this updated too.
  def valid_session
    {}
  end

<% unless options[:singleton] -%>
  describe "GET index" do
    it "assigns all <%= table_name.pluralize %> as @<%= table_name.pluralize %>" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :index, {}, valid_session
      assigns(:<%= table_name %>).should eq([<%= file_name %>])
    end
  end

<% end -%>
  describe "GET show" do
    it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :show, {:id => <%= file_name %>.to_param}, valid_session
      assigns(:<%= ns_file_name %>).should eq(<%= file_name %>)
    end
  end

  describe "GET new" do
    it "assigns a new <%= ns_file_name %> as @<%= ns_file_name %>" do
      get :new, {}, valid_session
      assigns(:<%= ns_file_name %>).should be_a_new(<%= class_name %>)
    end
  end

  describe "GET edit" do
    it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get :edit, {:id => <%= file_name %>.to_param}, valid_session
      assigns(:<%= ns_file_name %>).should eq(<%= file_name %>)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new <%= class_name %>" do
        expect {
          post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
        }.to change(<%= class_name %>, :count).by(1)
      end

      it "assigns a newly created <%= ns_file_name %> as @<%= ns_file_name %>" do
        post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
        assigns(:<%= ns_file_name %>).should be_a(<%= class_name %>)
        assigns(:<%= ns_file_name %>).should be_persisted
      end

      it "redirects to the created <%= ns_file_name %>" do
        post :create, {:<%= ns_file_name %> => valid_attributes}, valid_session
        response.should redirect_to(<%= class_name %>.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved <%= ns_file_name %> as @<%= ns_file_name %>" do
        # Trigger the behavior that occurs when invalid params are submitted
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        post :create, {:<%= ns_file_name %> => <%= formatted_hash(example_invalid_attributes) %>}, valid_session
        assigns(:<%= ns_file_name %>).should be_a_new(<%= class_name %>)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        post :create, {:<%= ns_file_name %> => <%= formatted_hash(example_invalid_attributes) %>}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested <%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        # Assuming there are no other <%= table_name %> in the database, this
        # specifies that the <%= class_name %> created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        <%- if Gem::Requirement.new('>= 4.0.0.beta1').satisfied_by?(Gem::Version.new(::Rails.version.to_s)) -%>
        <%= class_name %>.any_instance.should_receive(:update).with(<%= formatted_hash(example_params_for_update) %>)
        <%- else -%>
        <%= class_name %>.any_instance.should_receive(:update_attributes).with(<%= formatted_hash(example_params_for_update) %>)
        <%- end -%>
        put :update, {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => <%= formatted_hash(example_params_for_update) %>}, valid_session
      end

      it "assigns the requested <%= ns_file_name %> as @<%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => valid_attributes}, valid_session
        assigns(:<%= ns_file_name %>).should eq(<%= file_name %>)
      end

      it "redirects to the <%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        put :update, {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => valid_attributes}, valid_session
        response.should redirect_to(<%= file_name %>)
      end
    end

    describe "with invalid params" do
      it "assigns the <%= ns_file_name %> as @<%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        put :update, {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => <%= formatted_hash(example_invalid_attributes) %>}, valid_session
        assigns(:<%= ns_file_name %>).should eq(<%= file_name %>)
      end

      it "re-renders the 'edit' template" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        put :update, {:id => <%= file_name %>.to_param, :<%= ns_file_name %> => <%= formatted_hash(example_invalid_attributes) %>}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested <%= ns_file_name %>" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      expect {
        delete :destroy, {:id => <%= file_name %>.to_param}, valid_session
      }.to change(<%= class_name %>, :count).by(-1)
    end

    it "redirects to the <%= table_name %> list" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      delete :destroy, {:id => <%= file_name %>.to_param}, valid_session
      response.should redirect_to(<%= index_helper %>_url)
    end
  end

end
<% end -%>








