
def dataFromCURP(curp: str):

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

    pass