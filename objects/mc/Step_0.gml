#macro STRETCHING_LEFT -1
#macro STRETCHING_RIGHT 1
#macro STRETCHING_UP -1
#macro STRETCHING_DOWN 1
#macro STRETCHING_NEUTRAL 0

si = self.sprite_index



// try to stretch
height_stretch += rate_of_expansion
width_stretch += rate_of_expansion
image_xscale = width_stretch;
image_yscale = height_stretch;
get_real_coords()
set_all_collisions()

original_x = x
original_y = y

while(col_left or col_right) {
	if(col_left and col_right) break
	if(col_left) x += 1
	if(col_right) x -= 1
	get_real_coords()
	set_all_collisions()
}

while(col_bottom or col_top) {
	if(col_bottom and col_top) break
	if(col_top) y += 1
	if(col_bottom) y -= 1
	get_real_coords()
	set_all_collisions()
}

can_stretch_x = !(col_left and col_right)
can_stretch_y = !(col_top and col_bottom)

// untry
height_stretch -= rate_of_expansion
width_stretch -= rate_of_expansion
x = original_x
y = original_y

// input stretch
if(keyboard_check(ord("W")) and can_stretch_y) height_stretch += rate_of_expansion
if(keyboard_check(ord("S")) and can_stretch_y) height_stretch += rate_of_expansion
if(keyboard_check(ord("A")) and can_stretch_x) width_stretch += rate_of_expansion
if(keyboard_check(ord("D")) and can_stretch_x) width_stretch += rate_of_expansion

image_xscale = width_stretch;
image_yscale = height_stretch;
get_real_coords()
set_all_collisions()
// done :)

if(keyboard_check(ord("W")) and stretch_y == STRETCHING_NEUTRAL) {
	stretch_y = STRETCHING_UP
	y += 32
	sprite_set_offset(si, sprite_get_xoffset(si), 64)
}

if(keyboard_check(ord("A")) and stretch_x == STRETCHING_NEUTRAL) {
	stretch_x = STRETCHING_LEFT
	x += 31
	sprite_set_offset(si, 64, sprite_get_yoffset(si))
}

if(keyboard_check(ord("S")) and stretch_y == STRETCHING_NEUTRAL) {
	stretch_y = STRETCHING_DOWN
	y -= 32 + rate_of_expansion*64 + v_speed
	sprite_set_offset(si, sprite_get_xoffset(si), 0)
}

if(keyboard_check(ord("D")) and stretch_x == STRETCHING_NEUTRAL) {
	stretch_x = STRETCHING_RIGHT
	x -= 32
	sprite_set_offset(si, 0, sprite_get_yoffset(si))
}



if((!keyboard_check(ord("A")) and !keyboard_check(ord("D"))) or
	(keyboard_check(ord("A")) and keyboard_check(ord("D"))) or
	(keyboard_check(ord("A")) and stretch_x == STRETCHING_RIGHT) or
	(keyboard_check(ord("D")) and stretch_x == STRETCHING_LEFT)
) {
	stretch_x = STRETCHING_NEUTRAL
	width_stretch = 1
	x += 32 - sprite_get_xoffset(si)
	sprite_set_offset(si, 32, sprite_get_yoffset(si))
}

if((!keyboard_check(ord("W")) and !keyboard_check(ord("S"))) or
	(keyboard_check(ord("W")) and keyboard_check(ord("S"))) or
	(keyboard_check(ord("W")) and stretch_y == STRETCHING_DOWN) or
	(keyboard_check(ord("S")) and stretch_y == STRETCHING_UP)
) {
	if(stretch_y == STRETCHING_UP) y -= 1
	stretch_y = STRETCHING_NEUTRAL
	height_stretch = 1
	y += 32 - sprite_get_yoffset(si)
	sprite_set_offset(si, sprite_get_xoffset(si), 32)
}

width_stretch = min(width_stretch, max_width_multiplier)
height_stretch = min(height_stretch, max_height_multiplier)
width_stretch = max(width_stretch, min_width_multiplier)
height_stretch = max(height_stretch, min_height_multiplier)

v_speed += grav;
v_speed = min(v_speed, terminal_velocity);


image_xscale = width_stretch;
image_yscale = height_stretch;

y += v_speed;
x += h_speed;
run_collisions()
y = ceil(y)
frames_since_left++
frames_since_right++
frames_since_top++
frames_since_bottom++