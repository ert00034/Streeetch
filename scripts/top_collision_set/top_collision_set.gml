if(collision_line(real_x_left+rate_of_expansion*64 + 16,real_y_top, real_x_right - (16 + rate_of_expansion*64), real_y_top, block, true, true)) {
	col_top = true
} else col_top = false