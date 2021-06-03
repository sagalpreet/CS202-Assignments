def RemDupLoop(theList):
    if len(theList) == 0:
        return theList
    theList.sort()
    rectifiedList = [theList[0]]
    for i in range(1, len(theList)):
        if theList[i] == theList[i - 1]:
            continue
        rectifiedList.append(theList[i])
    return rectifiedList

def RemDupSet(theList):
    return list(set(theList))

print('Enter the elements of your list as space separated entities (extra spaces will be ignored):')
theList = list(map(str, input().split()))
print('Using RemDupLoop: ', *RemDupLoop(theList))
print('Using RemDupSet : ', *RemDupSet(theList))