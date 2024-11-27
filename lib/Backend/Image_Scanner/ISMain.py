# Current Status:
# The code scan a provided 'pdf' file for visible words and converts it to a text string.
# Once each page is scanned, the string for that page will be attached to a dictionary with the key representing the page number.

# To be Added:
# I need to find a way to directly add an image from camera, of course this should be provided through mobile features so I shall wait on that.
# I need to consider how to extract the items and quantities from each page. I've been considering utilising Gemini free edition for this. DONE

# Update:
# I have implemented the Gemini API to list what it see's, which is super ideal! Now I need to test it while inside the free parameters of the system 
# to meassure its accuracy.

# Libraries
import pytesseract
from pdf2image import convert_from_path
import google.generativeai as genai
import os

# Temporary file input for testing purposes
file_input = 'grocery2-receipt.pdf'

# Image to text converter (Scanner, smaller than expected)
def scan_image(file_input):
    images = convert_from_path(file_input)
    text_dict = {}
    for i, image in enumerate(images):
        text = pytesseract.image_to_string(image)
        text_dict.update({i+1: text})
    return text_dict

# Gemini Setup
api_key = os.environ['my_api_key_insert']
genai.configure(api_key=os.environ['my_api_key_insert'])
model = genai.GenerativeModel("gemini-1.5-flash")

def dict_text_processor(text_dict):
    text_value_list = []
    for value in text_dict.values():
        split_value = value.split('\n')
        new_value = '|'.join(split_value)
        text_value_list = text_value_list + [new_value]
    Whole_text = ' '.join(text_value_list)
    return Whole_text



# Main
text_dict = scan_image(file_input)
print(text_dict)
whole_text = dict_text_processor(text_dict)
print(whole_text)
prompt = f'''Without using any other filler, please list the item and it's quantity from the following scanned receipt: {whole_text}. 
Note that "|" was used to replace the "enter" function in python. If any number of "|" is between two food items, note that the food items are seperate.
Also note that if the food items are seperate, they don't share the same quantity or price.'''

response = model.generate_content(prompt)
print(response.text)

