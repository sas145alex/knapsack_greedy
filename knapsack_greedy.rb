dusts = {
  cinnamon: 10,
  clove: 15,
  cardamom: 30,
  vanilla: 50,
  silver: 150,
  saffron: 130,
  gold: 200,
  platinum: 230,
  painite: 700,
  diamond: 1500,
  californium: 20000
}

def get_random_dusts(hash_arg, n)
  if (hash_arg.length < n) || (n < 1)
    puts "\n*n greater than first_argument.length or n less than 1!"
    return
  end

  arr = hash_arg.keys
  filtered_arr = []
  n.times do
    cursor = rand( arr.length )
    filtered_arr.push( arr[cursor] )
    arr[cursor] = arr.pop
  end

  tmp = hash_arg.select{|k, v| filtered_arr.include?(k)}
  for i in tmp.keys do
    tmp[i] = [  tmp[i], rand(1..5)  ]
  end

  return tmp
end

def sort_dusts(hash_arg)
  hash_arg.sort_by{|k, v| k.to_s.length }.reverse
end

def print_dusts(hash_arg)
  size_of_max_keys = hash_arg.max_by{|k, v| k.length}[0].length
  size_of_max_keys = 8 if (size_of_max_keys.nil?) || (size_of_max_keys < 5)
  chunck_value = size_of_max_keys

  print("\n##" ++ ("#" * (size_of_max_keys-1) ) ++ "#####" ++ ("#" * (size_of_max_keys - 0) ) ++ "##" ++ "#####\n")
  hash_arg.each do |k, v|
    print("#" ++ (" " * size_of_max_keys) ++ "  #  " ++ (" " * size_of_max_keys) ++ " #" ++ (" " * 3) ++ " #\n")

    print("# ")
    print("#{k}")
    print(" " * (size_of_max_keys - k.to_s.length) )
    print(" # ")
    print("#{v[0]}".to_s)
    print(" " * (chunck_value - ("#{v[0]}".to_s.length - 1) ) )
    print(" # ")
    print("#{v[1]}".to_s)
    print(" " )
    print(" #\n")

    print("#" ++ (" " * size_of_max_keys) ++ "  #  " ++ (" " * size_of_max_keys) ++ " #" ++ (" " * 3) ++ " #\n")
    print("##" ++ ("#" * (size_of_max_keys-1) ) ++ "#####" ++ ("#" * (size_of_max_keys - 0) ) ++ "##" ++ "#####\n")
  end
end

# puts sort_dusts( get_random_dusts(dusts, 5) )
print_dusts( get_random_dusts(dusts, 5) )
