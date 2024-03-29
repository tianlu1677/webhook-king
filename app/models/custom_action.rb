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
class CustomAction < ApplicationRecord
  belongs_to :webhook
  acts_as_list scope: :webhook_id
  # before_create :cal_sort

  self.inheritance_column = 'category'

  def could_used_variable_names
    keys = webhook.default_template_param_keys

    self.position = webhook.custom_actions.last&.position.to_i + 1 if id.nil?
    return keys if position.to_i.zero?

    added_variables = webhook.custom_actions.where("category = 'CustomAction::Variable' and position < ?", position).all.map(&:input_name)

    keys + added_variables
  end

  def fetch_variable(from_variable, dict)
    arr = if from_variable.start_with?('request')
            from_variable.split('.')[1..] # 排除 Request
          else
            from_variable.split('.')
          end
    dict.dig(*arr)
  rescue StandardError
    nil
  end
end
