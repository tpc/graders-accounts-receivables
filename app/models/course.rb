class Course < ActiveRecord::Base
has_many:courseworks
def t_c
   title + ': ' + code
end
def c_t
   code + ': ' + title
end
end
