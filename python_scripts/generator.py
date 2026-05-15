start_x, start_y, end_x, end_y = 207, 156, 573, 598

step = 50
click_count = 50
delay = 0

i = 2

for y in range(start_y, end_y, step):
	for x in range(start_x, end_x, step):
		print( f"{i}|Left Move & Click|{x}, {y} Left, 1|{click_count}|{delay}|Click||||||")
		i += 1
