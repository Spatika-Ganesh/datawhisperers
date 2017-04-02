from jaccard import *
from graph import *
from algorithm import *
import parse

print('Parsing file')
pointList = parse.makePoints('corData.csv',)
print('Making Dict')
network = makeDict(pointList)
print('Making Graph')
graph = makeGraphFromDict('network', network)
print('Clustering Graph')
clusteredgraph = phaseOne(graph)
print('Writing graph')

parse.writeGraphCSV(clusteredgraph, clusteredgraph.getName())