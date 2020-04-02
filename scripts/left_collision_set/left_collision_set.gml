if(collision_line(
	real_x_left,
	real_y_bottom - (16 + rate_of_expansion*64),
	real_x_left,
	real_y_top + 16 + rate_of_expansion*64,
	block, true, true
)) {
	col_left = true
} else col_left = false