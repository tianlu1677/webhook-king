# frozen_string_literal: true

# == Schema Information
#
# Table name: requests
#
#  id             :bigint           not null, primary key
#  uuid           :string
#  url            :string
#  req_method     :string
#  ip             :string
#  hostname       :string
#  user_agent     :string
#  referer        :string
#  headers        :jsonb
#  status_code    :integer
#  user_id        :integer
#  token_uuid     :string
#  webhook_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  content_length :integer          default(0)
#  query_params   :jsonb
#  form_params    :jsonb
#  content_type   :string
#  media_type     :string
#  raw_content    :text
#
FactoryBot.define do
  factory :request do
    uuid { 'MyString' }
    url { 'MyString' }
  end
end
