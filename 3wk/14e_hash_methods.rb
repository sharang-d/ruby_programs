h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }


p h.member?("Matz")
p h.member?("Python")
p h.include?("Guido")
p h.include?("Ruby")
p h.has_value?("Larry")
#h.exists?("Perl")
