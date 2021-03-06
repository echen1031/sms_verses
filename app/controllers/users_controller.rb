class UsersController < ApplicationController
  before_filter :current_user
  decorates_assigned :user
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = UserDecorator.decorate_collection(@users)

    respond_to do |format|
      format.html 
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: current_user }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User saved successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = "User cannot be saved."
      render action: :new
    end
  end

  # GET /users/1/edit
  def edit 
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: current_user }
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    respond_to do |format|
      @user = current_user
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(current_user.id), 
          notice: 'User subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_now
    current_user.send_now
    redirect_to user_path(current_user),
        notice: 'User Email was successfully sent.'
  end
end
