from text_reader import textFrom
from curp_detector import isThisACURP
from data_extractor import dataFromCURP

def getDataFromINE(imagePath: str):

    '''
        Gets an image path for an INE
        (Mexican identification) note:
        
        NOTA: [El formato de la INE
        está pendiente de ver, pues
        es necesario saber en cuál
        lo enviará el frontend].

        And returns a JSON with all
        person data.
    '''

    # Reads the texts on the image:
    texts = textFrom(imagePath)

    # Detects if some text is a curp:
    for text in texts:
        xcurp = isThisACURP(text)
        if xcurp:
            print(f"{xcurp}")
            break
    if not xcurp:
        return {"Error": "No se detectó CURP :c"}
    
    # Extrae los datos de la persona, con base
    # a la CURP y los retorna:
    data = dataFromCURP(xcurp)

    return data
    
    
# Example of use:
dataOfChisrra = getDataFromINE("Images/chisrra.jpeg")