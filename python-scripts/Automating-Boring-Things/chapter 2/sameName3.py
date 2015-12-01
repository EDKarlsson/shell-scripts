def spam():
    global eggs
    eggs = 'spam'

def bacon():
    eggs = 'bacon'


eggs = 'global'
spam()
print(eggs)