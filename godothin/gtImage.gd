extends Node
class_name gtImage

var target
var type:String
var http_request:HTTPRequest

func setTarget(obj):
	target = obj
	
func downloadPng(url):
	type = "PNG"
	# Create an HTTP request node and connect its completion signal
	http_request = HTTPRequest.new()
	target.add_child(http_request)
	http_request.connect("request_completed", self, "_http_request_completed")
	# Perform the HTTP request. The URL below returns a PNG image as of writing.
	var http_error = http_request.request(url)
	if http_error != OK:
		print("An error occurred in the HTTP request.")
		print(http_error)
		
func _http_request_completed(result, response_code, headers, body):
	var image = Image.new()
	var image_error
	match type:
		"PNG": image_error = image.load_png_from_buffer(body)
		"JPG": image_error = image.load_jpg_from_buffer(body)
		"WEBP": image_error = image.load_webp_from_buffer(body)
	if image_error != OK:
		print("An error occurred while trying to display the image.")
	var texture = ImageTexture.new()
	texture.create_from_image(image)
	target.texture = texture
	target.remove_child(http_request)
