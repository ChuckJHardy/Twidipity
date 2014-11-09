class SubscribeToMailChimp
  def initialize email: email, optin: true
    @email = email
    @optin = optin
  end

  def self.call *args
    new(*args).call
  end

  def call
    gibbon.lists.subscribe options
  end

  private

  def options
    { id: id, email: { email: @email }, double_optin: @optin }
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
