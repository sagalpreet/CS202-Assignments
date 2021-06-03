def beautify(triangle, n):
    for i in range(n-2, -1, -1):
        for j in range(2*n+1):
            if triangle[i][j]==' ':
                triangle[i][j] = len(str(triangle[i+1][j]))*' '
            else:
                triangle[i][j] = str(triangle[i][j])
                targetSize = len(str(triangle[i+1][j]))
                while (len(triangle[i][j]) < targetSize - 1):
                    triangle[i][j] = triangle[i][j] + ' '
                    triangle[i][j] = ' ' + triangle[i][j]
                if (len(triangle[i][j]) < targetSize):
                    triangle[i][j] = triangle[i][j] + ' '
    return triangle

def pascalTriangle(n, symmetrical):
    n += 1
    triangle = [[' ']*(2*n + 1) for i in range(n)]
    triangle[0][n] = 1
    for i in range(1, n):
        length = i + 1
        start = n - length + 1
        end = n + length
        for j in range(start, end, 2):
            if (type(triangle[i - 1][j - 1]) == type(triangle[i - 1][j + 1]) == int):
                triangle[i][j] = triangle[i - 1][j - 1] + triangle[i - 1][j + 1]
            else:
                triangle[i][j] = 1
    if symmetrical:
        triangle = beautify(triangle, n)
    triangle.pop()
    for i in triangle:
        print(*i)
        print()        


print ('Enter the height of Pascal Triangle that you wish to have:', end = ' ')
n = int(input())
if (n < 20):
    pascalTriangle(n, True)
else:
    pascalTriangle(n, False)