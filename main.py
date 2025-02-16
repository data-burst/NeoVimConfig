# Add two vectors
def add_vectors(v1, v2):
    return [v1[i] + v2[i] for i in range(len(v1))]


# Matrix Multiplication
def matrix_multiplication(matrix1, matrix2):
    result = []
    for i in range(len(matrix1)):
        row = []
        for j in range(len(matrix2[0])):
            row.append(sum([matrix1[i][k] * matrix2[k][j] for k in range(len(matrix1[0]))]))
        result.append(row)
    return result
