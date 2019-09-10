require 'json'
require 'slack-notifier'
require 'logger'

def handler(event:, context:)
  logger = Logger.new(STDOUT)
  logger.info('[Lambda]START')

  begin
    message = JSON.parse(event["Records"][0]["Sns"]["Message"])

    alerm_name = message["AlarmName"]
    description = message["AlarmDescription"]
    value = message["NewStateValue"]
    reason = message["NewStateReason"]
    metric_name = message["Trigger"]["MetricName"]

    text = "AlarmName:#{alerm_name}\n"+
        "説明:#{description}\n"+
        "NewStateValue:#{value}\n"+
        "NewStateReason:#{reason}\n"+
        "MetricName:#{metric_name}"

    notifier = Slack::Notifier.new(ENV['WEB_HOOK_URL'], channel: ENV['WEB_HOOK_CHANNEL'])
    notifier.ping text
  rescue => e
    logger.error e
    logger.error event.to_s
    logger.error e.backtrace.join("\n")
  end

  logger.info('[Lambda]END')
end

