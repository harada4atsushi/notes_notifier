require 'rails/source_annotation_extractor'

desc <<-EOS
  desc. notes_notify
EOS
task :notes_notify => :environment do
  options = { tag: true }
  extractor = SourceAnnotationExtractor.new("FIXME|TODO|HACK")
  dirs = %w(app config db lib test) + (ENV['SOURCE_ANNOTATION_DIRECTORIES'] || '').split(',')
  results = extractor.find(dirs)

  fixme_count = 0
  todo_count = 0
  hack_count = 0

  results.each do |key, value_array|
    value_array.each do |annotation|
      fixme_count += 1 if annotation.tag == "FIXME"
      todo_count += 1 if annotation.tag == "TODO"
      hack_count += 1 if annotation.tag == "HACK"
    end
  end

  message = "FIXME: #{fixme_count}\nTODO: #{todo_count}\nHACK: #{hack_count}"
  puts message

  query = {
    token: NotesNotifier.token,
    channel: NotesNotifier.channel,
    username: NotesNotifier.bot_name,
    text: message
  }

  uri = Addressable::URI.parse(NotesNotifier.endpoint)
  uri.query_values ||= {}
  uri.query_values = uri.query_values.merge(query)
  response = Net::HTTP.get(URI.parse(uri))
  json = JSON.parse(response)

  unless json["ok"]
    puts json["error"]
  end
end