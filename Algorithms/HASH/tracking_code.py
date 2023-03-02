
def get_tracking_code(curp: str):

    '''
        Recieves a CURP and create a tracking code
        of eight characters, according to:

        It takes the curp on upper string, it concatenate
        the now current time (datetime.now()) as string
        (the format doesn't matters), and using SHA-256
        algorithm it converts into a unique code.

        The code doesn't has meaning, it only is a unique 8
        character tracking code that depends on the CURP and
        the moment in which the function is called.

        NOTE: THE GENERATED CODE IS UNIQUE AT THE TIME THAT
        IT IS GENERATED, SO, IT HAS TO BE GENERATED ONLY ONCE,
        AND SAVES IT INTO THE DATA BASE RELATED TO THE COMPLAIN
        MADED ON THE LAST FORM BUTTON TO FINISH THE PROCESS.

        Returns en eight characters string.
    '''

    import datetime

    # Converts the CURP into UPPERS:
    curp.upper()

    # Gets the current time and convert into string:
    now = datetime.datetime.now()
    nowstr = now.strftime("%d-%m-%Y %H:%M:%S")

    # Creates the complete string and converts it into tracking code:
    codestr = str(curp+nowstr)

    # Uses the sha-256 created function to get the tracking code:
    tracking_code = sha256(codestr)

    # Returns the generated code:
    return tracking_code


def eight_salt():

    import random

    characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    salt = ""
    for _ in range(8):
        salt += random.choice(characters)
    return salt


def sha256(basestring: str):

    '''
        Recieves a string and generates
        an eight characters tracking code
        with SHA-256 algorithm.

        Returns the 8 characters code.
    '''

    import hashlib

    # Generates a salt:
    salt = eight_salt()

    # Concatenates salt and the base string:
    string_to_hash = salt + basestring

    # Encode string to bytes:
    string_bytes = string_to_hash.encode("utf-8")

    # Creates hash object using SHA-256 algorithm
    hash_object = hashlib.sha256(string_bytes)

    # Gets hex digest of hash object:
    hex_digest = hash_object.hexdigest()

    # Gets first 8 characters of hex digest:
    xhash = hex_digest[:8]

    return str(xhash).upper()

# Example of use:
print(get_tracking_code("DOFC020612HASNLRA8"))