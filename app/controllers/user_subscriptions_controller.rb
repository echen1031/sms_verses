class UserSubscriptionsController < ApplicationController
  before_filter :current_user
  before_filter :current_user_subscription, :except => [:index, :new]

  # GET /user_subscriptions
  # GET /user_subscriptions.json
  def index
    @user_subscriptions = UserSubscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_subscriptions }
    end
  end

  # GET /user_subscriptions/1
  # GET /user_subscriptions/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: current_user_subscription }
    end
  end

  # GET /user_subscriptions/new
  # GET /user_subscriptions/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: current_user_subscription }
    end
  end

  # GET /user_subscriptions/1/edit
  def edit    
  end

  # POST /user_subscriptions
  # POST /user_subscriptions.json
  def create
    respond_to do |format|
      if current_user_subscription.save
        UserMailer.welcome_email(current_user).deliver
        format.html { redirect_to current_user_subscription, notice: 'User subscription was successfully created.' }
        format.json { render json: current_user_subscription, status: :created, location: @user_subscription }
      else
        format.html { render action: "new" }
        format.json { render json: current_user_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_subscriptions/1
  # PUT /user_subscriptions/1.json
  def update
    respond_to do |format|
      UserMailer.welcome_email(current_user).deliver
      if current_user_subscription.update_attributes(params[:user_subscription])
        format.html { redirect_to current_user_subscription, notice: 'User subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: current_user_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_subscriptions/1
  # DELETE /user_subscriptions/1.json
  def destroy
    current_user_subscription.destroy

    respond_to do |format|
      format.html { redirect_to user_subscriptions_url }
      format.json { head :no_content }
    end
  end

  private 
  def current_user 
    @user = User.find(params[:user_id])
  end

  def current_user_subscription
    @user_subscription = UserSubscription.find(params[:id])
  end

end
