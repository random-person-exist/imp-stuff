import itertools

def TSP_Implement(Adj_matrix, s):
    cities = []
    for i in range(V):
        if i != s:
            cities.append(i)


        min_distance = float('inf')
        for perm in itertools.permutations(cities):
            curr_distance = 0
            k = s
            for i in range(len(cities)):
                curr_distance += Adj_matrix[k][perm[i]]
                k = perm[i]
            curr_distance += Adj_matrix[k][s]
            min_distance = min(min_distance, curr_distance)

    print(cities)
    return min_distance

V = 4
Adj_matrix = [[0, 10, 15, 20], [10, 0, 35, 25], [15, 35, 0, 30], [20, 25, 30, 0]]
start = 0
print("The minimum cost is:", TSP_Implement(Adj_matrix, start))