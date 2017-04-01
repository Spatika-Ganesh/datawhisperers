import pandas


data = pandas.read_csv("data/data.txt", delimiter="\t")
dest = pandas.read_csv("data/dest.txt", delimiter="\t")

print("============================ DATA")
print(data)
print("\n")

print("============================ DEST")
print(dest)
print("\n")

