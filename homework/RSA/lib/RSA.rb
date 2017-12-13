class RSA
	def initialize n, e, d
		@n = n
		@e = e
		@d = d
	end
   
	def n
		return @n
	end
   
	def e
		return @e
	end
   
	def d
		return @d
	end
   
	def new_key
		p = 0
		q = 0
		until Prime.prime?(p) do
			p = rand(11..101)
		end
	
		until Prime.prime?(q) do
			q = rand(11..101)
		end
		n = p*q
		totient = (p-1).lcm(q-1)
	
		e = 0
		until e.gcd(totient) == 1 do
			e = rand(2..totient)
		end
	
		d = 0
		until d*e%totient == 1 do
			d = rand(1..5000)
		end
	
		new_key_array = Array.new
		new_key_array.push(n)
		new_key_array.push(e)
		new_key_array.push(d)
	
		@n = n
		@e = e
		@d = d
	end
   
	def encrypt message
		encryption_step_2 = 0
		encryption_step_1 = ""
		message.each_byte do |ascii_codes|
			encryption_step_1 += ascii_codes.to_s
			encryption_step_2 = encryption_step_1.to_i
		end
		c = encryption_step_2^e%n
	end
   
	def decrypt message
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representationand returns the decrypted message. 
	end 
end
