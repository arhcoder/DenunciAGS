
def isThisACURP(text: str):

    '''
        Recieves a text (str) and returns
        the same text if it is a valid CURP
        (CLAVE ÚNICA DE REGISTRO DE POBLACIÓN)
        from México, according to the CUPRSuite
        library algorithm to check format.
        Returns [False] in the other case.
    '''

    from curp import CURP
    try:
        curpobj = CURP(text)
        if curpobj:
            return text
    except:
        return False

# Example to use:
# print(isThisACURP("DOFC020612HASNLRA8"))