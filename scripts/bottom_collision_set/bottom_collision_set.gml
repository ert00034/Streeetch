if(collision_line(
	real_x_left+rate_of_expansion*64 + 1,
	real_y_bottom,
	real_x_right - (1 + rate_of_expansion*64),
	real_y_bottom, block, true, true
)) {
	col_bottom = true
} else col_bottom = false