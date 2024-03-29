# frozen_string_literal: true

# == Schema Information
#
# Table name: custom_actions
#
#  id            :bigint           not null, primary key
#  title         :string
#  description   :string
#  custom_action :string
#  webhook_id    :bigint           not null
#  category      :string
#  input_dict    :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  position      :integer
#
require 'rails_helper'

RSpec.describe CustomAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
