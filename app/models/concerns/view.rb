class View < ActiveRecord::Base
  enum view_type: {partial: 0, view: 1}
  translates :name
  globalize_accessors
end
