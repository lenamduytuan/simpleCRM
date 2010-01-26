class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  autocomplete_for :user, :lastname
  
  def new 
    @user=User.new
  end

  def create
    @user= User.new (params[:user])
    if @user.save
      flash[:notice]="Registration sucessful"
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def edit
    @user=@current_user
  end
  
  def show
    @user=@current_user
  end   

  def update
    @user=@current_user
    if @user.update_attributes(params[:user])
      flash[:notice]="Sucessfully created profile"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
