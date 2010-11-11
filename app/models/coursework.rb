class Coursework < ActiveRecord::Base
has_one:course
has_and_belongs_to_many:listings
end
