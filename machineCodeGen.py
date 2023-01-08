# a = 1;
# b = a + 1;
# c = b + 1;

# LOAD 1
# STORE a
# LOAD a
# ADD 1
# STORE b
# LOAD b
# ADD 1
# STORE c


# c = a+b
# LOAD A
# ADD B
# STORE C


# intermidiate_code = [c=a+b, z=c+r]

# Input 3 address code
# Input 3 add code as a list of strings
# ins_set = []
# Traverse the list using 'for' loop
# c = a+b
# add_code_divided = [c, =, a, +, b]

def machineCodeGen(intermidiate_code):
    ins_set = []
    for i in range(len(intermidiate_code)):
        line = intermidiate_code[i].split()
        # print(line)
        # print("-------------------------------------------")

        if(len(line) == 5):
            if (line[3] == "+"):
                ins_set.append(f"LOAD {line[2]}")
                ins_set.append(f"ADD {line[4]}")
                ins_set.append(f"STORE {line[0]}")
            
            elif (line[3] == "-"):
                ins_set.append(f"LOAD {line[2]}")
                ins_set.append(f"SUB {line[4]}")
                ins_set.append(f"STORE {line[0]}")

            elif (line[3] == "/"):
                ins_set.append(f"LOAD {line[2]}")
                ins_set.append(f"DIV {line[4]}")
                ins_set.append(f"STORE {line[0]}")

            elif (line[3] == "*"):
                ins_set.append(f"LOAD {line[2]}")
                ins_set.append(f"MUL {line[4]}")
                ins_set.append(f"STORE {line[0]}")

        elif (len(line) == 3):
            ins_set.append(f"LOAD {line[2]}")
            ins_set.append(f"STORE {line[0]}")

        else:
            raise ValueError("Enter a better instruction.")

    return ins_set
            

code = ["c = a + b", "c = b + 1", "d =  -a", "c = d"]

x = machineCodeGen(code)

for i in x:
    print(i)
    

