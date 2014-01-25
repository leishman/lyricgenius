require "lyricgenius/version"
require "mechanize"

module LyricGenius

  class Song
    attr_reader :agent, :query, :home_page

    def initialize
      @agent = Mechanize.new
      @base_url = 'http://rapgenius.com'
      @home_page = @agent.get @base_url
    end

    def search(query)
      results_page = submit_query query
      result_link = grab_link(results_page, 1)
      lyrics = grab_lyrics(result_link)
      artist, title = grab_song_info.split(/\s.\s/).map(&:strip)
      {title: title, artist: artist, lyrics: lyrics}
    end

    private

    def submit_query(query)
      form = @home_page.form
      form.q = query
      results_page = @agent.submit form
    end

    def grab_link(results_page, link_rank)
      relative_link = results_page.search('.song_link')[link_rank - 1].attributes["href"].value
      @base_url + relative_link
    end

    def grab_lyrics(lyrics_page_link)
      @lyrics_page = @agent.get lyrics_page_link
      @lyrics_page.search('.lyrics').map{ |link| link.text + "\n" }.join
    end

    def grab_song_info
      @lyrics_page.search('.song_title').text.strip
    end
  end
end