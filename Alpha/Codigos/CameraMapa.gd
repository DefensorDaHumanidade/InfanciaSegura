extends Camera2D



var _current_zoom_level = 1
var _drag = false

var arrastar = false

func _input(event):
	if event is InputEventScreenTouch:
		if arrastar:
			arrastar = false
		else:
#			posicaoInicial = event.position
			arrastar = true
	if event is InputEventMouseMotion and arrastar:
		if self.offset.x < 1000:
#			set_offset(get_offset() - event.relative*self.zoom)
			if self.offset.x > -1000:
#				set_offset(get_offset() - event.relative*self.zoom)
				pass
			else:
				self.offset.x = -999
		else: 
			self.offset.x = 999
		if self.offset.y < 600:
#			set_offset(get_offset() - event.relative*self.zoom)
			if self.offset.y > -400:
#				set_offset(get_offset() - event.relative*self.zoom)
				pass
			else:
				self.offset.y = -399
		else: 
			self.offset.y = 599
		set_offset(get_offset() - event.relative*self.zoom)
		print(self.offset.y)
#		emit_signal("moved")

#func _update_zoom(incr, zoom_anchor):
#	var old_zoom = _current_zoom_level
#	_current_zoom_level += incr
#	if _current_zoom_level < MAX_ZOOM_LEVEL:
#		_current_zoom_level = MAX_ZOOM_LEVEL
#	elif _current_zoom_level > MIN_ZOOM_LEVEL:
#		_current_zoom_level = MIN_ZOOM_LEVEL
#	if old_zoom == _current_zoom_level:
#		return
#
#	var zoom_center = zoom_anchor - get_offset()
#	var ratio = 1-_current_zoom_level/old_zoom
#	set_offset(get_offset() + zoom_center*ratio)
#
#	set_zoom(Vector2(_current_zoom_level, _current_zoom_level))
#	emit_signal("zoomed")
