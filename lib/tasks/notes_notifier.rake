desc <<-EOS
  desc. mofmof
EOS
task :mofmof do
  puts "notify!"
  puts NotesNotifier.channel

  SlackBot.setup do |config|
    config.token = NotesNotifier.token
    config.channel = NotesNotifier.channel
    config.bot_name = NotesNotifier.bot_name
    config.body = "デフォルトメッセージ"
  end

  # TODO  uninitialized constant SlackBot::Notify
  #SlackBot.notify
end