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

def writeGraphCSV(graph, graphName):

    filename = graphName + '.csv'
    with open(filename, 'w') as outfile:
        csvwriter = csv.writer(outfile, delimiter=' ')
        for node in graph.getNodes():
            csvwriter.writerow([node.getID(), node.getCommunity().getID()])
