# Code adapted from plot.ly/ipython-notebooks/networks

import networkx as nx
import matplotlib.pyplot as plt

def plotGraph(graph):
    g = nx.Graph()
    g.add_nodes_from(graph.getNodes())
    g.add_edges_from(graph.getEdges())
    nx.draw(g, node_color='c', edge_color='k', with_labels=True)
