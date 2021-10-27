def Q(p):
    _Q = QuaternionAlgebra(Zmod(p)(-1), Zmod(p)(-1))
    i = _Q.gen(0)
    j = _Q.gen(1)
    k = _Q.gen(2)
    result = []
    for k_1 in [0..(p-1)]:
        for k_2 in [0..(p-1)]:
            for k_3 in [0..(p-1)]:
                for k_4 in [0..(p-1)]:
                    result.append(k_1 + k_2*i + k_3*j + k_4*k)
    return result 
    
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

#checking if the modules are indeed simple, which they are...

#checks if for each x in I xQ = I. Then each x generates the whole module, which is equivalent to it being simple. 
def isSimpleMod(I,q):
    return set(listIdeal(I,q)) == set(I)
    
