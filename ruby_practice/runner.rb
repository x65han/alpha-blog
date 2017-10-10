require 'pp'
require_relative 'user'

user = User.new "x65han@uwaterloo.ca", "Johnson Han"

pp user

user.save