class UpdateSendhubWorker
  include Sidekiq::Worker
  def perform(user_id)
  	user = User.find(user_id)
  	raise 'invalid request' if user.nil?
    user.save_sendhub_user
    user.refresh_sendhub_ids
  end
end
