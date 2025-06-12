module Identification
  extend ActiveSupport::Concern

  included do
    before_action :identify
  end

  private

  def identify
    unless cookies.signed[:identifier]
      identifier = SecureRandom.uuid
      cookies.signed.permanent[:identifier] = {value: identifier}
    end

    Current.identifier = cookies.signed[:identifier]
  end
end
