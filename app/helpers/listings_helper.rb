module ListingsHelper
  def get_comma_separated_coursework_for_listing(courseworks)
    if courseworks.length == 1        
      return Coursework.find(courseworks[0].id).title         
    else 
      count = 0 
      a_str = '' 
      courseworks.each do |coursework| 
        a_str = a_str + Coursework.find(coursework.id).title 
        count += 1
        if count != courseworks.length        
          a_str += ', '         
        end 
      end 
      return a_str 
    end 
  end
end
