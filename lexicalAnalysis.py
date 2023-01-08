def lexicalAnalysis(code):
    # Create a list of tokens
    tokens = []
    
    # Split the code
    code = code.split()
    # print(lines)
    # Iterate through each line of code
    for word in code:
                
        # Check if the word is a keyword
        if word in ["int", "float", "double", "char", "void", "for", "while", "if", "else"]:
            tokens.append(("keyword", word))
            continue
                
            # Check if the word is an operator
        
                
            # Check if the word is a punctuation mark
        if word in [";", ",", "{", "}"]:
            tokens.append(("punctuation", word))
            continue

                
            # If the word is none of the above, it is considered a identifier
        tokens.append(("identifier", word))

    # print(tokens)
            
    return tokens

# Test the lexical analysis function
code = """
int main() {
  int x = 5;
  int y = 6;
  int z = x + y;
  return 0;
}
"""

output = lexicalAnalysis(code)
for i in range(len(output)):
    print(i+1, ". ",output[i], "\n")