
// check all 4 collisions first, then do logic based off the 4
col_bottom = false
col_top = false
col_left = false
col_right = false

get_real_coords()
set_all_collisions()

current_y = y

// Left collision line
if(col_left) {
	if(col_bottom and col_left) {
		y = yprevious
		if(stretch_y == STRETCHING_DOWN){
			y = y - (rate_of_expansion * 64 * 2 + v_speed)
		}
		get_real_coords()
		set_all_collisions()
	}
	while(col_bottom and col_left) {
		frames_since_left = 0
		x = floor(x)
		y = current_y
		x += 1
		get_real_coords()
		set_all_collisions()
	}
	if(col_bottom) y = yprevious
	get_real_coords()
	set_all_collisions()
	if(h_speed < 0) h_speed = 0
	if(stretch_x == STRETCHING_LEFT) h_speed += rate_of_expansion * width_stretch
	while(col_left) {
		x += 1
		get_real_coords()
		set_all_collisions()
	}
}
y = current_y
get_real_coords()
set_all_collisions()

// Right collision line
if(col_right) {
	if(col_bottom and col_right) {
		y = yprevious
		if(stretch_y == STRETCHING_DOWN) y = y - (rate_of_expansion * 64 * 2 + v_speed)
		get_real_coords()
		set_all_collisions()
	}
	while(col_bottom and col_right) {
		frames_since_right = 0
		y = current_y
		x = ceil(x)
		x -= 1
		get_real_coords()
		set_all_collisions()
	}
	if(col_bottom) y = yprevious
	get_real_coords()
	set_all_collisions()
	if(h_speed > 0) h_speed = 0
	if(stretch_x == STRETCHING_RIGHT) h_speed -= rate_of_expansion * width_stretch
	while(col_right) {
		x -= 1
		get_real_coords()
		set_all_collisions()
	}
}
y = current_y

get_real_coords()
set_all_collisions()
//image_yscale = height_stretch;


// Top collision line
if(col_top) {
	frames_since_top = 0
	y = ceil(y)
	v_speed = 0
	get_real_coords()
	set_all_collisions()
	while(col_top) {
		y += 1
		get_real_coords()
		set_all_collisions()
	}
}



// Bottom collision line
while(col_bottom == true) {
	frames_since_bottom = 0

	y -= grav
	if(stretch_y == STRETCHING_DOWN) {
		if(v_speed > 0) v_speed = 0
		else v_speed -= rate_of_expansion * height_stretch/jump_coef
	} else {
		v_speed = 0
	}
	get_real_coords()
	h_speed = h_speed * .999
	if(h_speed > 0 and h_speed < friction_block) h_speed = 0
	if(h_speed < 0 and h_speed > -friction_block) h_speed = 0
	if(h_speed > friction_block) h_speed -= friction_block
	if(h_speed < -friction_block) h_speed += friction_block
	//h_speed -= friction_block
	bottom_collision_set()
	
}
