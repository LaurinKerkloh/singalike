class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :identifier
  delegate :user, to: :session, allow_nil: true
end
