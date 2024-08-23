class ApplicationRecord < ActiveRecord::Base
  include FilterableModel
  primary_abstract_class
end
