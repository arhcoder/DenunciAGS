
def dataFromCURP(xcurp: str):

    '''
        Recieves a CURP [str]
        and returns the next data
        for the person of the CURP,
        on a JSON format:

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
        names = False
        first_last_name = False
        second_last_name = False
        with open("../Keys/curp.json") as file:
            token = str(json.load(file)["token"])
        
        # PARA OBTENER LOS DATOS DEL NOMBRE Y EL DOMICILIO:
        #   * PARA EL NOMBRE
        

        data["curp"] = curpobj.curp
        data["name"]["names"] = "A B"
        data["name"]["first_last_name"] = "C"
        data["name"]["second_last_name"] = "D"
        data["sex"] = "H" if curpobj.sexo.HOMBRE else "M"
        data["birthdate"] = curpobj.fecha_nacimiento.strftime("%d/%m/%Y")
        data["federative_entity"] = curpobj.entidad_iso
        data["domicile"]["postal_code"] = "X"
        data["domicile"]["cologne"] = "X"
        data["domicile"]["street"] = "X"
        data["domicile"]["exterior_number"] = "X"
        data["domicile"]["internal_number"] = "X"
        
        return data
    
    except:
        return {"error": "No sé qué pasó, pero pasó un error :D"}

print(dataFromCURP("DOFC020612HASNLRA8"))