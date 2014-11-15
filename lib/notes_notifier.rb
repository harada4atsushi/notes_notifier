require "notes_notifier/version"
require 'slack_bot'
#require 'slack_bot/app/models/notify'

module NotesNotifier
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/notes_notifier.rake"
    end
  end

  mattr_accessor :token do
    '<YOUR_SLACK_API_TOKEN>'
  end

  mattr_accessor :channel do
    '<YOUR_SLACK_CHANNEL_OR_GROUP>'
  end

  mattr_accessor :endpoint do
    'https://slack.com/api/chat.postMessage'
  end

  mattr_accessor :body do
    'body'
  end

  mattr_accessor :bot_name do
    'NotesNotifier'
  end

  mattr_accessor :unactive do
    false
  end

  def self.setup
    yield self if block_given?
  end
end
