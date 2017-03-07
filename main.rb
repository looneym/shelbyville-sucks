require 'json'
require 'frinkiac'

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
    puts name
    avatar_url = get_image(name)
    puts avatar_url
end

#data.each { |d| puts d["name"] }


