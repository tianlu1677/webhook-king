class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing "support@example.com" => :support

  routing :all => :incomings
end
