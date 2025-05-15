#from codebleu import calc_codebleu
import codebleu

pred = "def add ( a , b ) :\n return a + b"
ref = "def sum ( first , second ) :\n return second + first"

#res = codebleu.calc_codebleu([ref], [pred], "c")
res = codebleu
print(res)
