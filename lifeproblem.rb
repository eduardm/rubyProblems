def input
  while (true)
    gets
    exit if ($_.chomp == "42")
    puts $_.chomp
  end

end
input