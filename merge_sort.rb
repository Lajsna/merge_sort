if ARGV.empty?
	print "Enter values to be sorted:"
	array = gets.chomp.split(/\s+/).map!{ |x| x.to_f }
else
	array = ARGV.map!{ |x| x.to_f }
end

def merge_sort array
	return array if array.size == 1

	#insert clever comment
	a = merge_sort(array.shift(array.size / 2))
	b = merge_sort(array.shift(array.size))

	until a.empty? && b.empty? do
		if !a.empty? && b.empty?
			array << a.shift
		elsif a.empty? && !b.empty?
			array << b.shift
		else
			a.first > b.first ? array << b.shift : array << a.shift
		end
	end

	array
end

puts (merge_sort array).join(", ")
