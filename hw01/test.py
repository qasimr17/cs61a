import time 

def factors_a(x):

    start = time.time()
    factors = []
    for factor in range(1, int(x/2) + 1):
        if (x % factor == 0):
            factors.append(factor)
    print(factors.pop())
    end = time.time()
    print(end - start)


def factors_b(x):

    start = time.time()
    factor = x - 1
    while factor > 0:
        if x % factor == 0:
            print(factor)
            break
        factor -= 1
    end = time.time()
    print(end - start) 
        

NUM = 331232134
factors_a(NUM)
factors_b(NUM)
