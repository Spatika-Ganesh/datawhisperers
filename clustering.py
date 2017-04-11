from jaccard import *
from graph import *
from algorithm import *
import parse
from visualization import *

print('Parsing file')
pointList = parse.makePoints('corData.csv', 100)
print('Making Dict')
network = makeDict(pointList)
print('Making Graph')
graph = makeGraphFromDict('network', network)
print('Clustering Graph')
clusteredgraph = phaseOne(graph)
print('Writing graph')
createVis(clusteredgraph)

parse.writeGraphCSV(clusteredgraph, clusteredgraph.getName())
