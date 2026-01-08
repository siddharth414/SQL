# Online Python Playground
# Use the online IDE to write, edit & run your Python code
# Create, edit & delete files online



class Node:

  def __init__(self,val):
    self.data = val
    self.next = None

def reverse_list(head):

  curr = head
  prev = None

  

  while curr is not None:

    nextNode = curr.next
    curr.next  =  prev
    prev = curr
    curr = nextNode
  return prev

def print_nodes(node):
  while node!=None:
    print(f"{node.data}",end="")
    if node.next!=None:
      print("->",end="")
    node = node.next
  print()

if __name__== "__main__":

  head = Node(1)
  head.next = Node(2)
  head.next.next = Node(3)
  head.next.next.next = Node(4)

  head = reverse_list(head)

  print_nodes(head)
