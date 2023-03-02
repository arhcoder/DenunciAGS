
def dataFromCURP(xcurp: str, texts: list):

    '''
        Recieves a CURP [str]
        and returns the next data
        for the person of the CURP,
        on a JSON format:

        [IT ALSO RECIEVES THE LIST
        OF TEXTS ON THE INE, TO
        EXTRACT THE NAME OF THE GUY
        AND THE DOMICILE]:

        {
            "curp": "string",
            "name":
            {
                "names": "string",
                "first_last_name": "string",
                "second_last_name": "string"
            }
            "sex": "string ISO/IEC 5218",
            "birthdate": "string datatime.date",
            "federative_entity": "string ISO/IEC 5218",
            "domicile":
            {
                "postal_code": "string",
                "cologne": "string",
                "street": "string",
                "exterior_number": "int",
                "internal_number": "string"
            }
        }
    '''

    from difflib import SequenceMatcher
    from curp import CURP
    import json

    # Structure of the data:
    data = {
        "curp": "string",
        "name":
        {
            "names": "string",
            "first_last_name": "string",
            "second_last_name": "string"
        },
        "sex": "string ISO/IEC 5218",
        "birthdate": "string datatime.date",
        "federative_entity": "string ISO/IEC 5218",
        "domicile":
        {
            "postal_code": "string",
            "cologne": "string",
            "street": "string",
            "exterior_number": "int",
            "internal_number": "string"
        }
    }

    # Instanciate an object ob curp from CURPSuite:
    try:
        curpobj = CURP(xcurp)
        # print(f"Fecha de nacimiento: {curpobj.fecha_nacimiento}")
        # print(f"Sexo: {curpobj.sexo}")
        # print(f"Entidad: {curpobj.entidad}")
        # print(f"Entidad: {curpobj.entidad_iso}")
        # print(f"CURP: {curpobj.curp}")
        # print(f"Fecha de nacimiento: {curpobj._birth_date}")
        # print(f"Lugar de nacimiento: {curpobj._birth_place}")
        # print(f"JSON: {curpobj.json()}")

        # Tries to get personal information about the guy:
        names = " "
        first_last_name = " "
        second_last_name = " "
        with open("../Keys/curp.json") as file:
            token = str(json.load(file)["token"])
        
        '''
            PARA OBTENER LOS DATOS DEL NOMBRE Y EL DOMICILIO:
                * PARA EL NOMBRE SE PUEDE HACER DE DOS MANERAS:

                    1. Comprobando cada texto de la INE para
                    saber si alguno es el nombre o apellido;
                    con la función de la CURPSuite para saber
                    si un nombre va con el formato de API.

                    2. Usar la API "api.valida-curp.com.mx",
                    que la solicité (y hasta casi me peleé
                    con un asistente del servicio de la API
                    porque su correo me prometía 100 llamadas
                    de API gratis y sólo me estaban dando 5),
                    que ahora que veo, compruebo que la API me
                    da información que ya tengo y no necesito;
                    yo necesitaba el domicilio, pero ekis.
                    Seguramente termine desarrollando y
                    utilizando la 1, pero ahora me siento tonto
                    por pelear por una API que no voy a terminar
                    utilizando, ekisde.
        '''

        # Get the name of the person by the search method:
        # name_cantidates = []
        # first_last_name_cantidates = []
        # second_last_name_cantidates = []
        ''' for i, text in enumerate(texts):

            # CHECK NAMES:
            # If person has only one name, probe the single readed word:
            if curpobj.nombre_valido(text):
                print(f"Nombre candidato: {text}")
                pass
            # If person has two names:
            if i < len(texts) - 1:
                if curpobj.nombre_valido(str(text+(texts[i+1]))):
                    print(f"Nombre candidato: {text} {texts[i+1]}")
                    pass
            
            # CHECK LAST NAMES:
            if curpobj.primer_apellido_valido(text):
                print(f"Primer apellido candidato: {text}")
            
            if curpobj.segundo_apellido_valido(text):
                print(f"Primer apellido candidato: {text}") '''

        # Delimita el espacio entre las palabras:
        # NOMBRE y DOMICILIO, PUES EN LA INE estará ahí el nombre:
        word_index_for_name = 0
        word_index_for_domicile = 0
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
            first_last_name = str(texts[word_index_for_name+1])
        
        if curpobj.segundo_apellido_valido(texts[word_index_for_name+2]):
            # print(f"Segundo apellido: {texts[word_index_for_name+2]}")
            second_last_name = str(texts[word_index_for_name+2])
        
        if curpobj.nombre_valido(texts[word_index_for_name+3]):
            # print(f"Nombre: {texts[word_index_for_name+3]}")
            names = str(texts[word_index_for_name+4])

        if curpobj.nombre_valido(str(texts[word_index_for_name+3] + "" + texts[word_index_for_name+4])):
            # print(f"Nombre: {texts[word_index_for_name+3]} {texts[word_index_for_name+4]}")
            names = str(texts[word_index_for_name+3]) + " " + str(texts[word_index_for_name+4])



        data["curp"] = curpobj.curp
        data["name"]["names"] = names
        data["name"]["first_last_name"] = first_last_name
        data["name"]["second_last_name"] = second_last_name
        data["sex"] = "H" if curpobj.sexo.HOMBRE else "M"
        data["birthdate"] = curpobj.fecha_nacimiento.strftime("%d/%m/%Y")
        data["federative_entity"] = curpobj.entidad_iso
        data["domicile"]["postal_code"] = "X"
        data["domicile"]["cologne"] = "X"
        data["domicile"]["street"] = "X"
        data["domicile"]["exterior_number"] = "X"
        data["domicile"]["internal_number"] = "X"
        
        print(data)
        return data
    
    except:
        return {"error": "No sé qué pasó, pero pasó un error :D"}

# print(dataFromCURP("DOFC020612HASNLRA8"))