class GarStaticController < ApplicationController
  def get_listings_by_grader_or_coursework
    @graders = Grader.find_by_sql("select distinct graders.id, graders.name from graders left join listings on graders.id = listings.grader_id where listings.disposition = '' order by listings.id;")
    @courseworks = Coursework.find_by_sql("select courseworks.id, courseworks.title, courseworks.course_id, listings.id as listing_ids from (courseworks left join courseworks_listings on courseworks.id = courseworks_listings.coursework_id) left join listings on courseworks_listings.listing_id = listings.id where listings.disposition = '' order by listings.id;")
    render :partial => 'listings_by_grader_or_coursework', :layout => false
  end
  def index
#    @courseworks = Coursework.find(:all)
    @courseworks = Coursework.find_by_sql("select courseworks.id, courseworks.title, courseworks.course_id, listings.id as listing_ids from (courseworks left join courseworks_listings on courseworks.id = courseworks_listings.coursework_id) left join listings on courseworks_listings.listing_id = listings.id where listings.disposition = '' order by listings.id;")
  end

  def admin
  end
end
