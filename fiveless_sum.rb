def fiveless_sum(a, b)
  sum_of_all_numbers = (b + a)*(b - a + 1)/2
  first_multiple_of_five = a
  while (first_multiple_of_five % 5 != 0)
    first_multiple_of_five = first_multiple_of_five + 1
  end
  last_multiple_of_five = b
  while (last_multiple_of_five % 5 != 0)
    last_multiple_of_five = last_multiple_of_five - 1
  end
  number_of_multiples_of_five = ((last_multiple_of_five - first_multiple_of_five) / 5) + 1
  sum_of_all_multiples_of_five = ((number_of_multiples_of_five) * (first_multiple_of_five + last_multiple_of_five)) / 2
  puts sum_of_all_numbers - sum_of_all_multiples_of_five
end

fiveless_sum(44, 231)