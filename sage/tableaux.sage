

#schur symmetric
def genSemiStandardTableau(lmbda)
    Sym = SymmetricFunctions(QQ)
    m = Sym.m(lmda)
    s = Sym.s()
    ts = []

    #how to generate these actually, and can we iterate over them?
    for mu in range(lmda):
        ts.append(Tableau(m(s(mu)).coefficients()))
    return ts

#homogeneous symmetric
def genRowStrictTableau(lmda):
    Sym = SymmetricFunctions(QQ)
    m = Sym.m(lmda)
    e = Sym.e()
    ts = []

    #how to generate these actually, and can we iterate over them?
    for mu in range(lmda):
        ts.append(Tableau(m(e(mu)).coefficients()))
    return ts    
    
#complete symmetric
def genRowWeakTableau(lmda):
    Sym = SymmetricFunctions(QQ)
    m = Sym.m(lmda)
    h = Sym.h()
    ts = []
    
    #how to generate these actually, and can we iterate over them?
    for mu in range(lmda):
        ts.append(Tableau(m(h(mu)).coefficients()))
    return ts

#power symmetric
def genConstRowTableau(n):
    Sym = SymmetricFunctions(QQ)
    p = Sym.p()
    m = Sym.m(lmda)
    ts = []

    for mu in range(lmda):
        ts.append(Tableau(m(p(mu)).coefficients()))
    return ts
