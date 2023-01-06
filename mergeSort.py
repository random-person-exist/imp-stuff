def merge(left, right, main_list):
    l=r=k=0

    while(l<len(left) and r<len(right)):
        if (left[l] <= right[r]):
            main_list[k] = left[l]
            l = l+1
        elif(right[r] <= left[l]):
            main_list[k] = right[r]
            r = r+1
        k = k+1

    while(l<len(left)):
        main_list[k] = left[l]
        l = l+1
        k = k+1

    while(r<len(right)):
        main_list[k] = right[r]
        r = r+1
        k = k+1

    return main_list


def mergeSort(main_list):
    if (len(main_list) < 2):
        return main_list

    mid = len(main_list) // 2
    left = main_list[:mid]
    right = main_list[mid:]

    mergeSort(left)
    mergeSort(right)
    return merge(left, right, main_list)


main_list = [2, 3, 1, 6, 8, 4, 78, 60]
print(mergeSort(main_list))