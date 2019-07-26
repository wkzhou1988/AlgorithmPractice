# Deep clean a linked list
Question: How to deep clean a linked list, whose nodes has a value field pointing to another node in the list?

Solution: Make a dictionary of original nodes and copied nodes. Use this dictionary to find the copied node, given the original node. Thus, it is easy to copy, just iterate through the list. 

Unsolved: How to deal with a linked list with loop?