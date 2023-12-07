class GoogleApiService
  GOOGLE_API_URL = "https://vision.googleapis.com/v1/images:annotate".freeze
  LABEL_DETECTION = "LABEL_DETECTION".freeze
  OBJECT_LOCALIZATION = "OBJECT_LOCALIZATION".freeze
  WEB_DETECTION = "WEB_DETECTION".freeze
  TEXT_DETECTION = "TEXT_DETECTION".freeze
  IMAGE_PROPERTIES = "IMAGE_PROPERTIES".freeze
  LOGO_DETECTION = "LOGO_DETECTION".freeze

  # Method to analyze image; returns object info or error message
  def self.analyze_image(image_url)
    response = HTTParty.post("#{GOOGLE_API_URL}?key=#{ENV['GOOGLE_API_KEY']}",
                            body: vision_api_payload(image_url).to_json,
                            headers: {'Content-Type' => 'application/json'})

    parsed_response = response.parsed_response
    # p "👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻"
    # p parsed_response.to_json
    # p "👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻👻"

    first_object_found = find_info(parsed_response)
    first_object_found["name"] # This line will break if trash_json is { error: "No response data" }
  end

  private

  def self.vision_api_payload(image_url)
    {
      requests: [
        {
          features: [
            # the two types should be constants
            { type: LABEL_DETECTION, maxResults: 5 },
            { type: OBJECT_LOCALIZATION, maxResults: 5 },
            { type: WEB_DETECTION, maxResults: 5 },
            { type: TEXT_DETECTION, maxResults: 5 },
            { type: IMAGE_PROPERTIES, maxResults: 5 },
            { type: LOGO_DETECTION, maxResults: 5 }
            # ... other features of the Google Vision ...
          ],
          image: { source: { imageUri: image_url } }
        }
      ]
    }
  end

  def self.find_info(parsed_response)
    # The guard clause should be in the method call instead of here
    return { error: "No response data" } if parsed_response["responses"].nil?

    # This should be addressed with save navigation operators.
    first_object = parsed_response["responses"].first&.dig("localizedObjectAnnotations")&.first
    first_object || { error: "Trash not found" }
  end
end
