import csv
from jaccard import JaccardPoint

def makePoints(filename):
    jaccardPoints = []
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        next(reader)
        for row in reader:
            user_id = row[1]
            interests = row[2:11]
            jaccardPoints.append(JaccardPoint(user_id, interests))
    return  jaccardPoints
