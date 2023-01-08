operators = ['+', '-', '*', '/', '(', ')']

def eval_postfix(exp):
    exp = exp.split()

    print(exp)

    stack = []
    print(stack)
    
    for i in exp:
        print(stack)

        if i not in operators:
            stack.append(int(i))
        elif i == "+":
            a = stack.pop()
            b = stack.pop()
            stack.append(b+a)
        elif i == "-":
            a = stack.pop()
            b = stack.pop()
            stack.append(b-a)
        elif i == "*":
            a = stack.pop()                             # 6 5.58 
            b = stack.pop()
            stack.append(b*a)
        elif i == "/":
            a = stack.pop()
            b = stack.pop()
            stack.append(b/a)
            
    return stack


print(eval_postfix("10 5 3 - / 2 6 * +"))