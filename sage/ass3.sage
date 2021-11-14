R = GF(5)['x,y']
x = R.gen(0)
y = R.gen(1)

d_2 = Matrix([[x^2, -2*x*y+y^2], [x*y, x^2 + -1*y^2], [-1*y^2, x*y + -2*y^2]])

def findSol(mat):
    for i in range(5):
        for j in range(5):
            mat(i,j)
