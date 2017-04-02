import csv
from jaccard import JaccardPoint

def makePoints():
    jaccardPoints = []
    with open('corData.csv', 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            user_id = row[1]
            interests = row[2:11]
            jaccardPoints.append(JaccardPoint(user_id, interests))
