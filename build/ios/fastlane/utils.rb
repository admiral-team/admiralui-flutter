require './build_info.rb'

def replace(file:, regex:, with:)
  content = File.read(file)
  new_content = content.gsub(regex, with)
  File.open(file, "w") {|file| file.puts new_content }
end

def extract_issue_name(branch_name:)
  branch_array = branch_name.split("/")
  issue_name = branch_array.last.split("-").first
  issue_name
end

def send_message(build_info:, chat_ids:)
  info = formatted_build_info_telegram(build_info: build_info)
  send_telegram_message(text: info["text"], chat_ids: chat_ids, url_buttons: info["url_buttons"])
end

def send_telegram_message(text:, chat_ids:, url_buttons:)
  telegram_send_message(
    api_token: ENV['TELEGRAM_API_TOKEN'],
    chat_ids: chat_ids,
    text: text,
    parse_mode: "HTML",
    url_buttons: url_buttons
  )
end
