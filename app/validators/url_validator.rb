require 'uri'

class UrlValidator < ActiveModel::EachValidator

  def self.compliant?(value)
    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.blank? || self.class.compliant?(value)
      record.errors.add(attribute, "Merci de renseigner une URL valide du type http://www.exemple.com")
    end
  end

end
