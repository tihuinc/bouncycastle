class IndexController < ApplicationController

def index
  @recent = Subject.all(:limit => 5, :order => 'created_at desc')
  @random = Subject.all(:limit => 5, :order => 'random()')
end

end
