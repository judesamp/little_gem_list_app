require 'rspec'
require 'spec_helper'
require './app.rb'



describe GemKeeper do

  it "should have gems" do
    GemKeeper.gems.should_not be_empty
  end

  it "should return three random gems" do
    GemKeeper.random_gems.length.should eq 3
  end

  it "should have an empty array of user gems" do
    GemKeeper.user_gems.should be_empty
  end

  it "should reject blank user gem submissions" do
    GemKeeper.add_user_gem('')
    GemKeeper.user_gems.should be_empty
  end

  it "should reject user gem submissions that aren't a part of GemKeeper app" do
    GemKeeper.add_user_gem('oauth2')
    GemKeeper.user_gems.should be_empty
  end

  it "should add user gems" do
    first_count = GemKeeper.user_gems.count
    GemKeeper.add_user_gem('rack')
    second_count = GemKeeper.user_gems.count
    second_count.should be > first_count
  end
end