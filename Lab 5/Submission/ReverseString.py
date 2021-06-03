def reverseString(theString):
    words = list(map(str, theString.split(' ')))
    reversedString = ''
    for i in range(len(words)-1, -1, -1):
        reversedString = reversedString + words[i] + ' '
    return reversedString

print ("Enter a long string (extra spaces will be ignored):")
theString = input()
print(reverseString(theString))