require 'rubygems'
require 'action_controller'
require 'stories'
require 'stories/runner'

class ForrestStoriesTest < ActionController::IntegrationTest
  story "As a stories user I want to see the stories report " +
         "in a very nice format" do

    scenario "A user run forrest with a filepath as a param" do
    end

    scenario "A user run forrest with a StoryName as a param" do
    end

  end

  story "As a stories user I want to see the benchmark for each scenario" do

    scenario "A user run forrest with a StoryName as a param" do
    end

  end
end
