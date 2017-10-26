# Note: This is a companion problem to the System Design problem: Design TinyURL.
# TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk.
# 
# Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that 


@url_to_short = {}
@short_to_url = {}
@host = 'http://tinyurl.com/'
# Encodes a URL to a shortened URL.
#
# @param {string} longUrl
# @return {string}
def encode(longUrl)
  return @url_to_short[longUrl] if @url_to_short[longUrl]
  code = rand_string(6)
  while @short_to_url.keys.include?(@host+code)
    code = rand_string(6)
  end
  short_url = @host + code
  @url_to_short[longUrl] = short_url
  @short_to_url[short_url] = longUrl
  short_url
end

# Decodes a shortened URL to its original URL.
#
# @param {string} shortUrl
# @return {string}
def decode(shortUrl)
  @short_to_url[shortUrl]
end

def rand_string(len)
  [*('a'..'z'),*('0'..'9')].shuffle[0,len].join
end

# Your functions will be called as such:
# decode(encode(url))