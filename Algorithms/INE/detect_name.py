
def detectName(curpobj, texts: list):

    '''
        Recieves the list of texts from INE,
        and detects where is the person name:

        returns
        {
            "names": "string",
            "firs_last_name": "string",
            "second_last_name": "string"
        },

        If it do not found a name, it returns
        empty strings.
    '''

    from curp import CURP
    from difflib import SequenceMatcher

    complete_name = {
        "names": " ",
        "firs_last_name": " ",
        "second_last_name": " "
    }

    # Delimita el espacio entre las palabras:
    # NOMBRE y DOMICILIO, PUES EN LA INE estará ahí el nombre:
    word_index_for_name = 0
    # word_index_for_domicile = 0
    for i, text in enumerate(texts):
        # print(text)
        # Si encuentra la palabra "NOMBRE EN LA INE";
        # Es decir, si la palabra actual se parece en un 88% a "NOMBRE":
        # print(SequenceMatcher(None, str(text).upper, "NOMBRE").ratio())
        # Guarda en dos variables los índices de la lista de palabras entre
        # los que están las palabras NOMBRE y DOMICILIO:
        name_similarity_ratio = SequenceMatcher(None, str(text), str("NOMBRE")).ratio()
        domicile_similarity_ratio = SequenceMatcher(None, str(text), str("DOMICILIO")).ratio()
        if name_similarity_ratio > 0.88:
            word_index_for_name = i
            # print(text)
        if  domicile_similarity_ratio > 0.88:
            word_index_for_domicile = i
            # print(text)
        
    # Comprueba el nombre completo:
    # print(texts[word_index_for_name+1])
    # print(texts[word_index_for_name+2])
    # print(texts[word_index_for_name+3])
    # print(texts[word_index_for_name+3] + " " + texts[word_index_for_name+4])
    if curpobj.primer_apellido_valido(texts[word_index_for_name+1]):
        # print(f"Primer apellido: {texts[word_index_for_name+1]}")
        complete_name["first_last_name"] = str(texts[word_index_for_name+1])
    
    if curpobj.segundo_apellido_valido(texts[word_index_for_name+2]):
        # print(f"Segundo apellido: {texts[word_index_for_name+2]}")
        complete_name["second_last_name"] = str(texts[word_index_for_name+2])
    
    if curpobj.nombre_valido(texts[word_index_for_name+3]):
        # print(f"Nombre: {texts[word_index_for_name+3]}")
        complete_name["names"] = str(texts[word_index_for_name+4])

    if curpobj.nombre_valido(str(texts[word_index_for_name+3] + "" + texts[word_index_for_name+4])):
        # print(f"Nombre: {texts[word_index_for_name+3]} {texts[word_index_for_name+4]}")
        complete_name["names"] = str(texts[word_index_for_name+3]) + " " + str(texts[word_index_for_name+4])
    
    return complete_name