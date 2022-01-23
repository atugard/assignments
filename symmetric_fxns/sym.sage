Z.<x,y> = PolynomialRing(ZZ)
def makeSn(n):
    return groups.permutation.Symmetric(n).list()

def removeDuplicates(l):
    return list(set(l))

def padZeros(p,n):
    p = list(p)
    while len(p) < n:
        p.append(0)
    return tuple(p)

def isPartition(p):
    for i in range(1,len(p)):
        if p[i-1] >= p[i]:
            next
        else:
            return False
    return True

def symAct(p,n):
    if (not isPartition(p)):
        print("Argument must be a partition!")
        return []
    if (len(p)>n):
        print("The partition must not be longer than the number of variables!")
        return []
    
    p = padZeros(p,n)
    gp = makeSn(n)
    result = []
    
    for g in gp:
        p_new = [0] * n
        for i in range(n):
            p_new[i] = p[g(i+1)-1]
        result.append(tuple(p_new))
        
    return removeDuplicates(result)




