class UsersController < ApplicationController
  #Author: Donia Amer Shaarawy 22-0270
  #show is a method that when you recive the user you find the user with his id
	def show
    @user = User.find(params[:id])
  end
  #Author: Donia Amer Shaarawy 22-0270
  #new just calls on a new record
  def new
   @user = User.new
  end
 #Author: Donia Amer Shaarawy 22-0270
 #create adds a new record in the table with all the attributes also in this create 
 #we make the user sign up so we go to the log in page and like that we created a new user in the database
  def create
   @user = User.new(params[:user])
   if @user.save
   
      flash[:success] = "Welcome to MME7!"
      redirect_to :controller => 'sessions', :action => 'new' #, :notice => "Logged in!"
   else
     render "new"
    end
 end
end 