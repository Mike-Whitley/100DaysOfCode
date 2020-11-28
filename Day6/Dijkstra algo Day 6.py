#day6

def adjacency_list(graph_str):
    """takes graph string text returns lists of lists containing links between
    each vertex and weights """
    new_lines = graph_str.splitlines()
    #print(new_lines)
    header_text = new_lines.pop(0)
    header_text = header_text.split()
    graph_type = header_text[0]
    verticies = header_text[1]

    weight = False
    if len(header_text) > 2: #determines if its weighted graph 
        weight = True

    
    output_list = [[] for _ in range(int(verticies))] #creates a empty list of lists
    for i in new_lines:
        current_item = i.split() # splits each item into 2 - 3 seperate items
        origin_vertex = int(current_item[0]) #looks at current index 0 for initial index
        inverse_vertex = int(current_item[1]) #looks at 2nd item for undirected graph use
        
        if weight is True: #if its a weighted graph appends vertex with weight to list
            output_list[origin_vertex].append((int(current_item[1]), int(current_item[2])))
        else:
            output_list[origin_vertex].append((int(current_item[1]), None))
            
        if graph_type == "U": #checks if undirected if so adds other side to the output list
            if weight is True:
                output_list[inverse_vertex].append((int(current_item[0]), int(current_item[2])))
            else:
                output_list[inverse_vertex].append((int(current_item[0]), None))            
        
                
            #if weight is True:
                #output_list[origin_vertex].append((current_item[1], current_item[2]))
                #output_list[inverse_vertex].append((current_item[0], current_item[2])) 
            #else:
                #output_list[origin_vertex].append((current_item[1], None)) 
                #output_list[inverse_vertex].append((current_item[0], None)) 

    return output_list


def next_vertex(in_tree, distance):
    v = 1
    dist = max(distance)
    for i in range(len(distance)):
        if (in_tree[i] == False) and (dist > distance[i]):
            dist = distance[i]
            v = i
    return v


def dijkstra(Adj,s):
    n = len(Adj)
    in_tree = [False for _ in range(n)]
    distance = [float('inf') for _ in range(n)]
    parent = [None for _ in range(n)]
    distance[s] = 0
    
    for i in range(n):
        print(in_tree)
        u = next_vertex(in_tree, distance)
        print(u)
        in_tree[u] = True
        for v, weight in Adj[u]:
            if (in_tree[v] == False) and (distance[u] + weight < distance[v]):
                distance[v] = distance[u] + weight
                parent[v] = u
    return parent, distance











graph4 = """\
U 7 W
0 1 5
0 2 7
0 3 12
1 2 9
2 3 4
1 4 7
2 4 4
2 5 3
3 5 7
4 5 2
4 6 5
5 6 2
"""
a = adjacency_list(graph4)
print(dijkstra(a, 0))  