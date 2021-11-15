import itertools

R = GF(5)['x,y']
x = R.gen(0)
y = R.gen(1)

d_2 = Matrix([[x^2, -2*x*y+y^2], [x*y, x^2 + -1*y^2], [-1*y^2, x*y + -2*y^2]])

A = Matrix([[x,x,1], [2*x, 2*x, 2], [3*x, 3*x, 3]])

#generates all multinomials up to the degree in question
#1)generate all monomials with all coefficients
#2)write method that takes a list of lists and sums all elements in all lists in all combinations

def generateMonomials(deg):
    result = []
    for i in range(deg+1):
        for j in range(deg,-1,-1):
            for a in range(5):
                result.append(a*x^i * y^j)
    return list(set(result))

def combinations(ls):
    return list(map(sum,list(map(list ,list(itertools.product(*ls))))))


def genPolynomials(deg):
    result = []
    for i in range(deg+1):
        result.append(generateMonomials(deg))
    return list(combinations(result))

def mk2dvec(deg):
    vectors = []
    polys = genPolynomials(deg)
    for p1 in polys:
        for p2 in polys:
            vectors.append(vector([p1,p2]))
    return vectors
def getKernel(deg, A):
    vectors = mk2dvec(deg)
    result = [(0,0)]
    for vector in vectors:
        if (A * vector) == 0 and vector != 0:
            result.append(vector)
    return result

