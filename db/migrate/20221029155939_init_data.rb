# frozen_string_literal: true

class InitData < ActiveRecord::Migration[6.1]
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'backpacks', force: :cascade do |t|
    t.string 'uuid'
    t.string 'url'
    t.string 'req_method'
    t.string 'ip'
    t.string 'hostname'
    t.string 'user_agent'
    t.string 'referer'
    t.jsonb 'headers'
    t.integer 'status_code'
    t.integer 'user_id'
    t.string 'token_uuid'
    t.integer 'webhook_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'content_length', default: 0
    t.jsonb 'query_params'
    t.jsonb 'form_params'
    t.string 'content_type'
    t.string 'media_type'
    t.text 'raw_content'
    t.index ['webhook_id'], name: 'index_backpacks_on_webhook_id'
  end

  create_table 'custom_action_logs', force: :cascade do |t|
    t.integer 'webhook_id'
    t.integer 'from_custom_action_id'
    t.integer 'next_custom_action_id'
    t.integer 'backpack_id'
    t.jsonb 'original_params'
    t.jsonb 'custom_params'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'custom_actions', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'custom_action'
    t.bigint 'webhook_id', null: false
    t.string 'category'
    t.jsonb 'input_dict'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'position'
    t.index ['webhook_id'], name: 'index_custom_actions_on_webhook_id'
  end

  create_table 'operation_logs', force: :cascade do |t|
    t.string 'user_id'
    t.string 'params'
    t.string 'action'
    t.string 'controller'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  # create_table 'users', force: :cascade do |t|
  #   t.datetime 'created_at', precision: 6, null: false
  #   t.datetime 'updated_at', precision: 6, null: false
  #   t.string 'email', null: false
  #   t.string 'encrypted_password', limit: 128, null: false
  #   t.string 'confirmation_token', limit: 128
  #   t.string 'remember_token', limit: 128, null: false
  #   t.boolean 'is_admin', default: false
  #   t.index ['email'], name: 'index_users_on_email'
  #   t.index ['remember_token'], name: 'index_users_on_remember_token'
  # end

  create_table 'webhooks', force: :cascade do |t|
    t.string 'uuid'
    t.string 'receive_email'
    t.datetime 'expired_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'webhook_token'
    t.integer 'user_id'
    t.integer 'resp_code', default: 200
    t.string 'resp_body', default: ''
    t.string 'resp_content_type', default: 'text/plain'
    t.boolean 'cors_enabled', default: true
    t.text 'script_content'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'custom_actions', 'webhooks'
end
