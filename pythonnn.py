import cv2
grap = cv2.imread("gripe.jpg")
cv2.imshow("grape",grap)


font=cv2.FONT_HERSHEY_SIMPLEX
cv2.putText(grap,"grapes",(100,100),font,1,(255,0,0),1)
cv2.imshow("grape",grap)

im = Image.open("grape.jpg")
pix = list(im.getdata())

for x in range(len(pix)): 
    print(pix[x]) 

def format_name(first_name, last_name):
  if last_name=="" and first_name=="":
    return(str("") +"," + str("") )
  elif last_name=="":
    return("Name: " + first_name ) 
  elif first_name=="":
    print("Name: " + last_name )
  else:
	  return("Name: " + last_name + ", " +first_name)

print(format_name("Ernest", "Hemingway"))
# Should return the string "Name: Hemingway, Ernest"

print(format_name("", "Madonna"))
# Should return the string "Name: Madonna"

print(format_name("Voltaire", ""))
# Should return the string "Name: Voltaire"

print(format_name("", ""))
# Should return an empty str


def octal_to_string(octal):
    result = ""
    value_letters = [(4,"r"),(2,"w"),(1,"x")]
    # Iterate over each of the digits in octal
    for ___ in [int(n) for n in str(octal)]:
        # Check for each of the permissions values
        for value, letter in value_letters:
            if ___ >= value:
                result += ___
                ___ -= value
            else:
                ___
    return result
    
print(octal_to_string(755)) # Should be rwxr-xr-x
print(octal_to_string(644)) # Should be rw-r--r--
print(octal_to_string(750)) # Should be rwxr-x---
print(octal_to_string(600)) # Should be rw-------

def format_address(address_string):
  # Declare variables
  house=""
  street=""
  lists=[]
  # Separate the address string into parts
  lists=address_string.split(" ")
  # Traverse through the address parts
  for i in lists:
    # Determine if the address part is the
    # house number or part of the street name
    if i[0].lower()<='z' and i[0].lower()>='a':
      street+=i
    else:
      house+=i
  # Does anything else need to be done 
  # before returning the result?
  
  # Return the formatted string  
  return "house number {} on street named {}".format(house,street)

print(format_address("123 Main Street"))
# Should print: "house number 123 on street named Main Street"

print(format_address("1001 1st Ave"))
# Should print: "house number 1001 on street named 1st Ave"

print(format_address("55 North Center Drive"))
# Should print "house number 55 on street named North Center Drive"

