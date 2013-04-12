require 'spec_helper'

describe PostsController do

  def valid_attributes
   {:content => "put valid attributes"}
  end

  def invalid_attributes
   {:content => ""}
  end

describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :createPostGroup, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :createPostGroup, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the group show" do
        post :createPostGroup, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.any_instance.stub(:save).and_return(false)
        post :createPostGroup, {:post => valid_attributes}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'show' template" do
        Post.any_instance.stub(:save).and_return(false)
        post :createPostGroup, {:post => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end

    describe "PUT updateProject" do
    describe "with valid params" do
      it "updates the requested project" do
        post = Post.create! valid_attributes
        put :updatePostGroup, {:id => post.to_param, :post => update_attributes }
      end

      it "assigns the requested project as @project" do
        post = Post.create! valid_attributes
        put :updatePostGroup, {:id => post.to_param, :post => valid_attributes}
        assigns(:post).should eq(post)
      end


      it "redirects to the project" do
        post = Post.create! valid_attributes
        put :updatePostGroup, {:id => post.to_param, :@post => valid_attributes}
        response.should redirect_to("http://test.host/groups/show/1")
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        project = Post.create! valid_attributes
        Post.any_instance.stub(:save).and_return(false)
        put :updatePostGroup, {:id => post.to_param, :post => invalid_attributes}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'editProject' template" do
        post = Post.create! valid_attributes
        Post.any_instance.stub(:save).and_return(false)
        put :updatePostGroup, {:id => post.to_param, :post => invalid_attributes}
        response.should render_template("editProject")
      end
    end
  
  
end
end