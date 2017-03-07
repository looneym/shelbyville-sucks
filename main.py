from bs4 import BeautifulSoup
import jsonpickle

def get_email(name):
    no_special_chars = "".join( c for c in name if  c not in "'':." )
    no_whitespace = "".join(no_special_chars.split())
    email = no_whitespace.lower() + "@example.com"
    return email

class Character:

    characters = []

    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.characters.append(self)        


soup = BeautifulSoup(open("index.html"))
mydivs = soup.findAll("div", { "class" : "info" })
names = []
for d in mydivs:
    children = d.find_all("a")
    name = children[0].getText()
    name = str(name)
    include = "y"
#    include = raw_input("Include %s? "  % (name))
    if include.lower() == "y":
        email = get_email(name)
        char = Character(name, email)

json_obj = jsonpickle.encode(Character.characters, unpicklable=False)
 
f = open("output.json", 'w')   
f.write(json_obj)
f.close()



