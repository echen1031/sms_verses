class UpdateSendhubWorker
  include Sidekiq::Worker
  def perform(user_subscription_id)
  	user_subscription = UserSubscription.find(user_subscription_id)
  	raise 'invalid request' if user_subscription.nil?
    user_subscription.save_sendhub_user
    user_subscription.refresh_sendhub_ids
  end
end
