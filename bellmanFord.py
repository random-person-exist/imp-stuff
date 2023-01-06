def bellman(graph,source):
    
    #Assigning distances of ininity to every node
    distances = {i: float('inf') for i in graph}
    print(distances)
    distances[source] = 0 #Weight of source node is 0
    for i in range(len(graph)-1): #the maximum number of iterations can be n-1
        for parent, edge in graph.items():
            for item in edge:
                if distances[parent] + item[1] < distances[item[0]]:
                    distances[item[0]] = distances[parent] + item[1]
       
    #If the weight still changes that means there is a cycle
    for parent, edge in graph.items():
        for item in edge:
            if distances[parent] + item[1] < distances[item[0]]:
                raise ValueError("Negative cycle exists")
                
                
    return distances
                
graph = {
    'A': [('B', 4),('D',5)],
    'B': [],
    'C': [('B', -10)],
    'D': [('C',3)]
}

source = 'A'

distances = bellman(graph, source)
print(distances)