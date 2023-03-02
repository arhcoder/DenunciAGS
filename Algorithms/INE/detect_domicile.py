
def is_number(string: str):
    try:
        float(string)
        return True
    except ValueError:
        return False

def detectDomicile(texts: list):

    '''
        Recieves the list of texts from INE,
        and detects where is the domicile:

        returns
        {
            "postal_code": "string",
            "cologne": "string",
            "street": "string",
            "exterior_number": "string",
            "internal_number": "string",
            "state": "string",
            "municipality": "string"
        },

        If it do not found a name, it returns
        empty strings.
    '''

    from curp import CURP
    from difflib import SequenceMatcher

    domicile = {
        "postal_code": " ",
        "cologne": " ",
        "street": " ",
        "exterior_number": " ",
        "internal_number": "NA",
        "municipality": " ",
        "state": " "
    }

    # Delimita el espacio entre las palabras:
    # DOMCILIO y CLAVE, PUES EN LA INE estará ahí el domicilio:
    word_index_for_domicile = 0
    word_index_for_clave = 0
    for i, text in enumerate(texts):
        # print(text)
        # Si encuentra la palabra "DOMICILIO EN LA INE";
        # Es decir, si la palabra actual se parece en un 88% a "DOMICILIO":
        # print(SequenceMatcher(None, str(text).upper, "DOMICILIO").ratio())
        # Guarda en dos variables los índices de la lista de palabras entre
        # los que están las palabras NOMBRE y CLAVE:
        domicile_similarity_ratio = SequenceMatcher(None, str(text), str("DOMICILIO")).ratio()
        clave_similarity_ratio = SequenceMatcher(None, str(text), str("CLAVE")).ratio()
        if domicile_similarity_ratio > 0.88:
            word_index_for_domicile = i
            # print(text)
        if clave_similarity_ratio > 0.88:
            word_index_for_clave = i
            # print(text)
    
    # print("DOMICILIO:")
    complete_domicile = texts[word_index_for_domicile+1: word_index_for_clave]
    # print(complete_domicile)
    # print()

    # Separa las partes del domicilio de la siguiente manera:
    '''
        CALLE
        [NÚMERO] NÚMERO EXTERIOR
        COLONIA
        [NÚMERO] CÓDIGO POSTAL
        ESTADO
        MUNICIPIO
    '''
    # Separates each detects a number:
    street = ""
    exteriorNumber = ""
    internalNumber = "NA"
    cologne = ""
    postalCode = ""
    municipality = ""
    state = ""
    i = 0

    # print(complete_domicile)

    # Separates the street:
    while i < len(complete_domicile):
        if not is_number(str(complete_domicile[i])):
            street += str(complete_domicile[i])+" "
            i += 1
        else:
            break
    # print(f"Calle: {street}")
    
    # Separates the exterior number:
    exteriorNumber = str(complete_domicile[i])
    # print(f"Número exterior: {exteriorNumber}")

    # If it has an internal number after:
    if is_number(complete_domicile[i+1]):
        internalNumber = str(complete_domicile[i+1])
        i += 1
    # print(f"Número interior: {internalNumber}")
    
    # Separates the cologne:
    i += 1
    while i < len(complete_domicile):
        if not is_number(str(complete_domicile[i])):
            cologne += str(complete_domicile[i]) + " "
            i += 1
        else:
            break
    # print(f"Colonia: {cologne}")
    
    # Separates the postal code:
    postalCode = str(complete_domicile[i])
    # print(f"Código postal: {postalCode}")

    # Separates the municipality:
    i += 1
    while i < len(complete_domicile):
        if not is_number(str(complete_domicile[i])) and str(complete_domicile[i]) != "," and str(complete_domicile[i]) != ".":
            municipality += str(complete_domicile[i])
            i += 1
        else:
            break
    # print(f"Municipio: {municipality}")

    # Separates the state:
    while i <= len(complete_domicile):
        if not is_number(str(complete_domicile[i])) and str(complete_domicile[i]) != "," and str(complete_domicile[i]) != ".":
            state += str(complete_domicile[i])
            break
        else:
            i += 1
    # print(f"Estado: {state}")

    domicile["postal_code"] = postalCode
    domicile["cologne"] = cologne
    domicile["street"] = street
    domicile["exterior_number"] = exteriorNumber
    domicile["internal_number"] = internalNumber
    domicile["state"] = state
    domicile["municipality"] = municipality

    # print(domicile)
    return domicile