require 'audio_trimmer'
require 'open-uri'

class Search < ApplicationRecord
  include HTTParty

  URL = 'http://www.scpr.org/api/v3/articles?query='

  def self.query(q)
    response = HTTParty.get(URL + q)
    if response['articles']
      articles = []
      response['articles'].each do |article|
        articles.push({
          'title': article['title'],
          'audio': self.extract_audio(article)
        })
      end
      return articles
    else
      return []
    end
  end

  def self.extract_audio(article)
    if article['audio']
      audio_array = []
      article['audio'].each do |audio|
        file_name = Rails.root.join('tmp', 'audio', "#{article['id']}_long.mp3").to_s
        short_file = Rails.root.join('tmp', 'audio', "#{article['id']}_short.mp3").to_s

        if trimmed_audio = Audio.find_by_url(audio['url'])
          audio_array.push(AudioSerializer.new(trimmed_audio))
        else
          open(file_name, 'wb') do |file|
            file << open(audio['url']).read
          end
          trimmer = AudioTrimmer.new(input: file_name)
          trimmer.trim start:0, finish:10, output: short_file.to_s
          trimmed_audio = Audio.new(url: audio['url'])
          trimmed_audio.clip = File.new(short_file)
          trimmed_audio.save
          audio_array.push(trimmed_audio)
        end
      end
      # TODO: remove audio in /tmp directory
      return audio_array
    end
    return []
  end

end
