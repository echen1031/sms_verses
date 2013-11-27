class UserSubscriptionsController < ApplicationController
  before_filter :current_user
  before_filter :current_user_subscription, :except => [:index, :new, :create]

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
    @user_subscription = UserSubscription.new

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
    @user_subscription = UserSubscription.new(params[:user_subscription])

    respond_to do |format|
      if @user_subscription.save
        UserMailer.start_subscription(current_user, @user_subscription).deliver
        format.html { redirect_to user_user_subscription_url(current_user, @user_subscription), notice: 'User subscription was successfully created.' }
        format.json { render json: @user_subscription, status: :created, location: @user_subscription }
      else
        format.html { render action: "new" }
        format.json { render json: @user_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_subscriptions/1
  # PUT /user_subscriptions/1.json
  def update
    respond_to do |format|
      UserMailer.start_subscription(current_user, current_user_subscription).deliver
      if current_user_subscription.update_attributes(params[:user_subscription])
        format.html { redirect_to user_user_subscription_path(current_user, current_user_subscription), notice: 'User subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: current_user_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_now
    UserMailer.daily(current_user, current_user_subscription).deliver
  end

  # DELETE /user_subscriptions/1
  # DELETE /user_subscriptions/1.json
  def destroy
    UserMailer.end_subscription(current_user, current_user_subscription).deliver
    current_user_subscription.destroy
    respond_to do |format|
      format.html { redirect_to user_user_subscriptions_url(current_user) }
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
