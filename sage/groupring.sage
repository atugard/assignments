k = GF(3)
G = SymmetricGroup(3)
kG = GroupAlgebra(G,k)

def _kG(n):
    k = GF(n)
    G = SymmetricGroup(n)
    kG = GroupAlgebra(G,k)
    R_1 = kG.gen(0)
    R_2 = R_1^2
    T_1 = kG.gen(1)
    T_2 = T_1 * R_1 
    T_3 = R_1 * T_1
    e = T_1^2
    result = []
    for i_1 in range(3):
        for i_2 in range(3):
            for i_3 in range(3):
                for i_4 in range(3):
                    for i_5 in range(3):
                        for i_6 in range(3):
                            result.append(i_1 * e + i_2 * R_1 + i_3 * R_2 + i_4 * T_1 + i_5 * T_2 + i_6 * T_3)
    return list(set(result))

def nilpotents(R):
    results = []
    for r in R:
        _r = r
        i = 0
        temp = []
        while len(set(temp)) == len(temp):
            _r = _r * r
            if _r == 0:
                i=1
                break
            temp.append(_r)
        if i == 1:
            results.append(r)
    return list(set(results))

def qideal(x,q):
    return list(set([x*y for y in q]))

def zerodivisors(q):
    return [y for y in q if y * conjugate(y) == 0]

def zeroIdeals(q):
    return [qideal(x,q) for x in zerodivisors(q)]

def listIdeal(l, q):
    return list(set.intersection(*map(set,[y for y in [qideal(x,q) for x in l] if y != [0]])))

    

def is_ann(x,l):
    for y in l:
        if y*x != 0:
            return False
    return True 
    
#annihilators of l in q 
def ann(l, q):
    return [x for x in q if is_ann(x,l)] 

def anns(ls, q):
    return [ann(l,q) for l in ls]

def zeroIdealAnn(q):
    ls = zeroIdeals(q)
    return anns(ls,q)

def intersectZeroIdealAnns(q):
    return list(set.intersection(*map(set,zeroIdealAnn(q))))

def intersectIdeals(Is):
    return list(set.intersection(*map(set, Is)))
#checking if the modules are indeed simple, which they are...

#checks if for each x in I xQ = I. Then each x generates the whole module, which is equivalent to it being simple. 
def isSimpleMod(I,q):
    return set(listIdeal(I,q)) == set(I)
    



R_1 = kG.gen(0)
R_2 = R_1^2
T_1 = kG.gen(1)
T_2 = T_1 * R_1 
T_3 = R_1 * T_1
e = T_1^2
e_1 = e + R_1 + R_2 + T_1 + T_2 + T_3
e_2 = e + R_1 + R_2 - T_1 - T_2 - T_3
e_3 = 2*e - R_1 - R_2 
A = _kG(3)

l1 = list(set([e_1 * x for x in A]))
l2 = list(set([e_2 * x for x in A]))
l3 = list(set([e_3 * x for x in A]))
l4 = list(set([x_1 + x_2 + x_3 for x_1 in l1 for x_2 in l2 for x_3 in l3]))
nA = nilpotents(A)

I = list(set([nA[0]*y for y in A]))

#not all are invertible, so you could still generate simple modules out of these. 
Ic = [x for x in A if x not in I]

J = list(set([Ic[2] * x for x in A]))






