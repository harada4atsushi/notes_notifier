

desc <<-EOS
  desc. mofmof
EOS
task :mofmof do
  puts "notify!"
  puts NotesNotifier.channel

  query = {
    token: NotesNotifier.token,
    channel: NotesNotifier.channel,
    username: NotesNotifier.bot_name,
    text: "デフォルトメッセージ"
  }

  uri = Addressable::URI.parse(NotesNotifier.endpoint)
  uri.query_values ||= {}
  uri.query_values = uri.query_values.merge(query)

  Net::HTTP.get(URI.parse(uri))
end