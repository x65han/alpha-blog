require 'json'

class User
  attr_accessor :email, :name, :permission

  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permission = User.permissions_from_template
  end

  def self.permissions_from_template
    file = File.read 'user_permissions_template.json'
    JSON.load(file, nil, symbolize_names: true)
  end

  def save
    output_json = {email: @email, name: @name, permissions: @permissions}.to_json
    open("output.json", 'a') do |file|
      file.puts output_json
    end
  end
end

  