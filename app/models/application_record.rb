class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.export_collection_to_csv(condition = nil)
    collection = condition ? self.where(condition) : self.all

    CSV.generate(headers: true) do |csv|
      csv << self.new.attributes.keys.map { |key| key }
      collection.each do |instance|
        csv << instance.attributes.values.map { |val| val }
      end
    end
  end

end
