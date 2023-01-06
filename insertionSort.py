arr = [3, 4, 5, 2]

def insertionSort(arr):
    for i in range(len(arr)):
        key = arr[i]
        j = i-1

        while (j>=0 and key<arr[j]):
            arr[j+1] = arr[j]
            j = j-1

        arr[j+1] = key
    return arr


print(insertionSort(arr))
    

