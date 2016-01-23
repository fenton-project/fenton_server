# Classes inherit ApplicationRecord for creating shared features
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
