draw_self();

draw_text(x + 0, y + 0, string("Vspeed: ") + string(v_speed));

draw_text(0, 40, string("col_bottom: ") + string(col_bottom));
draw_text(0, 60, string("col_right: ") + string(col_right));
draw_text(0, 80, string("col_top: ") + string(col_top));

draw_text(0, 20, string("col_left: ") + string(col_left));

draw_text(200,20,string("x: ") + string(x))
draw_text(200,50,string("y: ") + string(y))
draw_text(400,20,string("stretch_x: ") + string(stretch_x))
draw_text(400,50,string("stretch_y: ") + string(stretch_y))
draw_text(600,20,string("frames_since_left: ") + string(frames_since_left-1))
draw_text(600,40,string("frames_since_right: ") + string(frames_since_right-1))
draw_text(600,60,string("frames_since_top: ") + string(frames_since_top-1))
draw_text(600,80,string("frames_since_bottom: ") + string(frames_since_bottom-1))
draw_text(800,60,string("can_stretch_x: ") + string(can_stretch_x))
draw_text(800,80,string("can_stretch_y: ") + string(can_stretch_y))

get_real_coords()

// draw gradients
draw_set_alpha(0.5);
if(stretch_x == STRETCHING_LEFT) {
	draw_rectangle_colour(real_x_left, real_y_bottom, real_x_right, real_y_top, c_white, c_black, c_black, c_white, false);
}

if(stretch_x == STRETCHING_RIGHT) {
	draw_rectangle_colour(real_x_left, real_y_bottom, real_x_right, real_y_top, c_black, c_white, c_white, c_black, false);
}

if(stretch_y == STRETCHING_UP) {
	draw_rectangle_colour(real_x_left, real_y_bottom, real_x_right, real_y_top, c_white, c_white, c_black, c_black, false);
}

if(stretch_y == STRETCHING_DOWN) {
	draw_rectangle_colour(real_x_left, real_y_bottom, real_x_right, real_y_top, c_black, c_black,c_white, c_white, false);
}
draw_set_alpha(1);