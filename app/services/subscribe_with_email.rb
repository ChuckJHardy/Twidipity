class SubscribeWithEmail
  def initialize(address:, controller:, optin: true)
    @address = address
    @controller = controller
    @optin = optin
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    gibbon.lists.subscribe options
    @controller.redirect_to @controller.root_path, notice: ':)'
  end

  private

  def options
    { id: id, email: { email: @address }, double_optin: @optin }
  end

  def gibbon
    Gibbon::API.new key
  end

  def id
    Rails.application.secrets.mail_chimp_list_id
  end

  def key
    Rails.application.secrets.mail_chimp_key
  end
end
