# frozen_string_literal: true

# == Schema Information
#
# Table name: webhooks
#
#  id                :bigint           not null, primary key
#  uuid              :string
#  receive_email     :string
#  expired_at        :datetime
#  user_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  webhook_token     :string
#  user_id           :integer
#  resp_code         :integer          default(200)
#  resp_body         :string           default("")
#  resp_content_type :string           default("text/plain")
#  cors_enabled      :boolean          default(TRUE)
#  script_content    :text
#
require 'rails_helper'

RSpec.describe Webhook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
