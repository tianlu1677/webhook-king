# frozen_string_literal: true

if Rails.env.production?
  return unless ENV.fetch('SENTRY_DSN', nil)

  Sentry.init do |config|
    config.dsn = ENV.fetch('SENTRY_DSN', nil)

    config.breadcrumbs_logger = %i[active_support_logger http_logger]

    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |_context|
      true
    end
  end
end
