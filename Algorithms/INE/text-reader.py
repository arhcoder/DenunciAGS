
def textFrom(imageURL: str):

    '''
        Recieves a local image (INE) path
        (str) and returns all the texts in
        a list with each word.
    '''

    # Imports for the text detection:
    import io
    import os
    import json
    from google.cloud import vision
    from google.cloud.vision_v1 import types
    from google.oauth2.service_account import Credentials

    # Set the Google Vision API key:
    with open("../Keys/vision.json") as file:
        keys = json.load(file)
    credentials = Credentials.from_service_account_info(keys)

    # Instantiates a client:
    client = vision.ImageAnnotatorClient(credentials=credentials)

    # Loads the image into memory:
    with io.open(imageURL, "rb") as image_file:
        content = image_file.read()
    image = types.Image(content=content)

    # Performs text detection on the image:
    response = client.text_detection(image=image)
    texts = response.text_annotations

    # Creates a list with all the texts:
    words: list = []
    for text in texts:
        words.append(text.description)

    # Prints the detected text:
    # for text in texts:
    #    print('"{}"'.format(text.description))

    return words

# Example use:
print(textFrom("Images/ine.png"))