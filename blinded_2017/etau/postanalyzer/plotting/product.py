

def get_cart_pr(ll):

    if len(ll)==1:
        return [  [x] for x in ll[0]  ]
    
    res = [ items + [item] for items in get_cart_pr(ll[:-1]) for item in ll[-1] ]


    return res


print( get_cart_pr([[1,2,3], [4,5], [6,7]]) )