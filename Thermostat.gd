extends Sprite2D

var isCooling = true
var currentTemp = 71
var setTemp = 70
var tempChangeRate = 0.1
var indoorTempLabel

func _ready():
	pass

func _process(delta):
	indoorTempLabel = get_node("IndoorTempLabel")
	_ac_operation(delta)
	
	_update_indoor_temp_label()
	
	print(currentTemp)

func _on_temp_up_button_pressed():
	setTemp += 1

func _on_mode_button_pressed():
	if isCooling:
		isCooling = false
	else:
		isCooling = true
		
	print(isCooling)

func _on_temp_down_button_pressed():
	setTemp -= 1

func _ac_operation(delta):
		if isCooling and currentTemp > setTemp:
			currentTemp -= tempChangeRate * delta
		
		if not isCooling and currentTemp < setTemp:
			currentTemp += tempChangeRate * delta

func _update_indoor_temp_label():
	var intTemp = int(currentTemp)
	indoorTempLabel.text = "Indoor Temp: " + str(intTemp)
