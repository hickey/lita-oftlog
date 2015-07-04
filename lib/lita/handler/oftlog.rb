module Lita
  module Handlers
    class Oftlog < Handler
      URL = "https://ajax.googleapis.com/ajax/services/search/images"
      VALID_SAFE_VALUES = %w(active moderate off)
      QUERIES = [ 'oh for the love of god', 'stupid idea', 'stupid butt',
                  'post turtle']

      config :safe_search, types: [String, Symbol], default: :active do
        validate do |value|
          unless VALID_SAFE_VALUES.include?(value.to_s.strip)
            "valid values are :active, :moderate, or :off"
          end
        end
      end
      
      config :searches, types: [Array], default: QUERIES
      

      route(/(?:Oh\s+for\s+the\s+love\s+of\s+God|\boftlog\b)/i, :fetch, 
        command: false, help: {
        "oh for the love of god" => "Image of the slap you should receive."
      })

      def fetch(response)
        query = config.searches[rand(config.searches.count)]

        http_response = http.get(
          URL,
          v: "1.0",
          q: query,
          safe: config.safe_search,
          rsz: 8
        )

        data = MultiJson.load(http_response.body)

        if data["responseStatus"] == 200
          choice = data["responseData"]["results"].sample
          if choice
            response.reply ensure_extension(choice["unescapedUrl"])
          else
            response.reply %{No images found for some random idiotic idea.}
          end
        else
          reason = data["responseDetails"] || "unknown error"
          Lita.logger.warn(
            "Couldn't get image from Google: #{reason}"
          )
        end
      end

      private

      def ensure_extension(url)
        if [".gif", ".jpg", ".jpeg", ".png"].any? { |ext| url.end_with?(ext) }
          url
        else
          "#{url}#.png"
        end
      end
    end

    Lita.register_handler(Oftlog)
  end
end
