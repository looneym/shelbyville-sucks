require 'json'
require 'frinkiac'
require 'intercom'

token = ENV["INTERCOM_PAT"]
intercom = Intercom::Client.new(token: token)

file = File.read "./output.json"
data = JSON.parse(file)

def get_image(name)
  scr =  Frinkiac::Screencap.search(name).first
  if(scr != nil) 
    scr.image_url
  end
end

data.each do |d|
    name = d["name"]
    email = d["email"]
    puts name
    avatar_url = get_image(name)
    user = intercom.users.create(email: email, name: name)
    user.avatar.image_url = avatar_url
    intercom.users.save(user)
end



