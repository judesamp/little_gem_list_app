require 'sinatra'

get "/" do
  @gems_array = GemKeeper.gems
  @three_random_gems = GemKeeper.random_gems
  @user_gems = GemKeeper.user_gems
  erb :'favorite_things/index'
end

post "/gems" do
  user_gem = params[:gem_name]
  if GemKeeper.add_user_gem(user_gem)
    redirect "/"
  else
    redirect "/stupid_gem_error"
  end
end

get "/stupid_gem_error" do
  erb :"favorite_things/stupid_gem_error"
end




class GemKeeper
  @@gems_array = `gem list --no-versions`.split
  @@user_gems = []

  def self.gems
    @@gems_array
  end

  def self.random_gems
    temp_array = []
    3.times do
      random_gem = @@gems_array.sample
      temp_array.push(random_gem)
    end
    temp_array
  end

  def self.user_gems
    @@user_gems
  end

  def self.add_user_gem(gem)
    if @@gems_array.include? (gem.downcase)
      @@user_gems.push(gem.downcase) 
    else
      false
    end
  end
end







