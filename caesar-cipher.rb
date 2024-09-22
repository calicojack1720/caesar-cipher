# caesar-cipher
# Takes in a string and a shift number and then outputs the caesar cipher with the specified shift.
# by calicojack1720
# Created: 9/1/24
# Updated: 9/5/24

#Precondition: `letter` is an integer representing the ascii code of one of the letters in the message and `s` is the shift amount
#Postcondition: returns a character that has been shifted by the amount `s`
def perform_shift(ascii, s)
	# check for space
	if ((ascii < 97) || (ascii > 122)) && ((ascii < 65) || (ascii > 90))
		return ascii.chr
	end

	ascii += s

	if ascii > 122
		ascii -= 25
	end

	if (ascii < 97) && (ascii > 90)
		ascii -= 25
	end
	
	return ascii.chr
end

# get input from arguments
message = ARGV[0].to_s
if message.empty?
	printf "No message provided, quitting..."
	exit
end

shift = ARGV[1].to_s
if shift.empty?
	printf "No shift number provided, quitting..."
	exit
end

shift = shift.to_i

encrypted = ""

message.split("").each do |i|
	letter = message[i].to_s
	encrypted = encrypted.to_s.concat(perform_shift(letter.ord, shift))
end

p encrypted
