ActiveAdmin.register Quote do

permit_params :quote, :author

filter :author
filter :quote

end
