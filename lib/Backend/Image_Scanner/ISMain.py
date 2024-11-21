# Current Status:
# The code scan a provided 'pdf' file for visible words and converts it to a text string.
# Once each page is scanned, the string for that page will be attached to a dictionary with the key representing the page number.

# To be Added:
# I need to find a way to directly add an image from camera, of course this should be provided through mobile features so I shall wait on that.
# I need to consider how to extract the items and quantities from each page. I've been considering utilising Gemini free edition for this.

# Libraries
import pytesseract
from pdf2image import convert_from_path

# Temporary file input for testing purposes
file_input = 'test_image_2.pdf'

# Image to text converter (Scanner, smaller than expected)
def scan_image(file_input):
    images = convert_from_path(file_input)
    text_dict = {}
    for i, image in enumerate(images):
        text = pytesseract.image_to_string(image)
        text_dict.update({i+1: text})
    return text_dict

# Main
text_dict = scan_image(file_input)
print(text_dict)


