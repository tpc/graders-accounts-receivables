class ListingsController < ApplicationController
  # GET /listings
  # GET /listings.xml
  def get_sort_by_code_or_title
    def get_sorted_by_first_significant_word(original)
      a_hash, s_arr = {}, []
      excise = ['a', 'the', 'el']
      num_sub = ['elementary', 'intermediate', 'advanced', 'master']
      for x in original
        an_arr = x.split()
        if excise.include?(an_arr[0].downcase())
          a_hash[an_arr[1...an_arr.length].join(' ')] = x
        elsif num_sub.include?(an_arr[0].downcase())
          a_str = an_arr[1...an_arr.length].join(' ').strip() + num_sub.index(an_arr[0].downcase()).to_s()
          a_hash[a_str] = x
        else
          a_hash[x] = x
        end
      end
      for x in a_hash.keys().sort()
        s_arr.push(a_hash[x])
      end
      return s_arr
    end
    def get_courses_sorted_by_title(a_coll)
      a_hash, b_arr = {}, []
      for course in a_coll
        a_hash[course.title] = course
      end
      s_array = get_sorted_by_first_significant_word(a_hash.keys())
      for canon_title in s_array
        b_arr.push(a_hash[canon_title])
      end
#      return s_array
      return b_arr
#     return a_hash
    end 
    @sorted_courses_english = get_courses_sorted_by_title(Course.find_by_sql("select * from courses where substring(code, 1, 3) != 'TBP' and substring(code, 1, 3) != 'EAT' and substring(code, 1, 4) != 'ENT2';"))
    @sorted_courses_spanish = get_courses_sorted_by_title(Course.find_by_sql("select * from courses where substring(code, 1, 3) = 'TBP' or substring(code, 1, 3) = 'EAT' or substring(code, 1, 4) = 'ENT2' order by title;"))
    render :partial => 'sort_by_code_or_title', :layout => false
  end
  sorted_courses_english = Course.find_by_sql("select * from courses where substring(code, 1, 3) != 'TBP' and substring(code, 1, 3) != 'EAT' and substring(code, 1, 4) != 'ENT2';")
  def index
    @listings = Listing.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new
#    @sorted_courses_english = Course.find_by_sql("select * from courses where substring(code, 1, 3) != 'TBP' and substring(code, 1, 3) != 'EAT' and substring(code, 1, 4) != 'ENT2' order by title;")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        flash[:notice] = 'Listing was successfully updated.'
        format.html { redirect_to(@listing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
