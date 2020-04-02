if(collision_line(
	real_x_right,
	real_y_bottom - (16 + rate_of_expansion*64),
	real_x_right,
	real_y_top + 16 + rate_of_expansion*64,
	block, true, true
)) {
	col_right = true
} else col_right = false