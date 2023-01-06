G = [[0, 19, 5, 0, 0],
     [19, 0, 5, 9, 2],
     [5, 5, 0, 1, 6],
     [0, 9, 1, 0, 1],
     [0, 2, 6, 1, 0]]

number_of_vertices=5
number_of_edges=0
infinity=999999

selected_node=[True,0,0,0,0]

print("Edge : Weight\n")

while(number_of_edges <number_of_vertices-1):
    minimum_weight =infinity
    a=0
    b=0
    for m in range(number_of_vertices):
        if selected_node[m]:
            for n in range(number_of_vertices):
                if((not selected_node[n]) and G[m][n]):
                    # not in selected and there is an edge
                    if minimum_weight>G[m][n]:
                        minimum_weight=G[m][n]
                        a=m
                        b=n
    print(str(a)+"-"+ str(b) + ":" + str(G[a][b]))
    selected_node[b] = True
    number_of_edges += 1