class Listing < ActiveRecord::Base
has_one:grader
has_and_belongs_to_many:courseworks
has_one:student
GRACE_PERIOD = 60
def grace_period
  return GRACE_PERIOD
end
validates_presence_of :grader_id, :student_id, :coursework_ids
end
