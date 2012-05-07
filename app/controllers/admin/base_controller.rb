class Admin::BaseController < ApplicationController
  layout 'admin'
  # YAGNI, sure, but of course admin has auth
  # and it will be nice to have admin controllers
  # have a shared base controller when that time
  # comes
end