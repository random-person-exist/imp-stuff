value = [18, 25, 27, 10, 15]
weight = [3, 5, 4, 3, 6]
capacity = 12

n  = len(value) - 1

def knapSack(value, weight, capacity):
    profit_density = []

    for i in range(0,n-1):
        profit_density[i] = value[i] / weight[i]

    print(profit_density)

knapSack(value, weight, capacity)

