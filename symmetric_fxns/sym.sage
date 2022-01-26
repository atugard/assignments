def mkPartition(wc):
    return sorted(wc, reverse=True)

def mkSn(n):
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

#generates all permutations of the partition p.
def genWC(p,n):
    if (not isPartition(p)):
        print("Argument must be a partition!")
        return []
    if (len(p)>n):
        print("The partition must not be longer than the number of variables!")
        return []
    
    p = padZeros(p,n)
    gp = mkSn(n)
    result = []
    
    for g in gp:
        p_new = [0] * n
        for i in range(n):
            p_new[i] = p[g(i+1)-1]
        result.append(tuple(p_new))
        
    return removeDuplicates(result)

#takes a partition and a number of variables, and returns the corresponding monomial symmetric polynomial 
def genSymPoly(p,n):
    m = SymmetricFunctions(ZZ).m()
    return m(p).expand(n)

#check m_(k)*m_l = m_(k+l) + m_(k,l), for m in n variables
def check1(k,l,n):
    m = genSymPoly([k],n)*genSymPoly([l],n)
    if k != l:
        return m  == genSymPoly([k+l],n) + genSymPoly(mkPartition([k,l]),n)
    else:
        return m == genSymPoly([k+l],n) + 2*genSymPoly(mkPartition([k,l]),n)
    
#check m_(a,b) * m_(c) = m_(a+b,c) + m_(a,b+c) + m_(a,b,c)
def check2(a,b,c,n):
    m1 = genSymPoly(mkPartition([a,b]),n)*genSymPoly([c],n)
    m2 = genSymPoly(mkPartition([a+c,b]),n) + genSymPoly(mkPartition([a,b+c]),n) + genSymPoly(mkPartition([a,b,c]),n)
    print (m1 == m2)
    return [m1,m2]


