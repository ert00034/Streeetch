if(stretch_x == STRETCHING_LEFT) {
	real_x_left = x - 64*width_stretch
	real_x_right = x
}

if(stretch_x == STRETCHING_RIGHT) {
	real_x_left = x
	real_x_right = x + 64*width_stretch
}

if(stretch_x == STRETCHING_NEUTRAL) {
	real_x_left = x - 32
	real_x_right = x + 32
}

if(stretch_y == STRETCHING_UP) {
	real_y_bottom = y
	real_y_top = y - 64*height_stretch
}

if(stretch_y == STRETCHING_DOWN) {
	real_y_bottom = y + 64*height_stretch - 1
	real_y_top = y
}

if(stretch_y == STRETCHING_NEUTRAL) {
	real_y_bottom = y + 32
	real_y_top = y - 32
}
real_y_top = real_y_top-1