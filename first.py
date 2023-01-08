def first(grammar, non_terminal, visited=None):
    """Find the first set of a non-terminal in a grammar."""
    if visited is None:
        visited = set()
    first_set = set()
    if non_terminal in visited:
        return first_set
    visited.add(non_terminal)
    for production in grammar[non_terminal]:
        if production[0].isupper():
            first_set.update(first(grammar, production[0], visited))
        else:
            first_set.add(production[0])
    return first_set


# Example grammar
grammar = {
    'start': ['E'],
    'E': ['E+T', 'T'],
    'T': ['T*F', 'F'],
    'F': ['(E)', 'id'],
}

# Find the first and follow sets
first_set = {non_terminal: first(grammar, non_terminal) for non_terminal in grammar}
print(first_set)