In this article we are going to familiar with Tree data structure & its terms. It will help us to know the basic of tree which are needed for my upcoming tree algorithms.



What is Tree? .. From botany we can have different answer , but in computer science , (I am avoiding bookish definition), A tree is a simple data structure in a real life tree manner. That means, we need to redefine some terms of the tree data structure in data structure context(not botany context). Let's get started 



Node : An item in tree that contains data/ represents object.

Edges/Branched : Links that connects Nodes. Usually they are directed from start node to end node. (Parent to child). When they are drawn top down approach, directions are usually ignored as top referring parent by default.
Usually a node considered to be at most 1 parent.

Note : Multiple parents are avoided in whole discussion.


Root : It is a Spatial Parent node which has no Parent Node. Usually this is the beginning of the tree so, refers to as root. It is the only node in tree without parent.

Ancestor/Parent : A node that has at least one node below(having at least one child). If a multiple level of parents present, all of them are called Ancestors. 



Child/Descendant : Any Node below of a node, in short the child node. A decedent or child can be a subtree. 

Leaf : A child node if have no child of its own, then it will be called Leaf (end of the tree structure) 


Sub Tree : A subtree is a subset of a tree has a node(sub tree root) with its decedents and branches. (may consist of more sub tree)



Internal Node : Node with at least one child called internal node. So, it means it includes Root is also an internal node. (detail opinion here)
  

Siblings : Nodes has the same parent
 

Lowest/First/Least Common Assenter(LCA) : The first common parent shared by 2 or more nodes. From picture, you can Red node(root) is LCA of two green node. 


Now , let's talk about Node Quality

Level : The distance (edge) between root to a particular node is called level.
As root note level consider as Zero.  

Height : The longest distance from a node to a leaf.
in this example , the red node level is 2, height is 1.


Degree :  A node degree is the number of children it has.
So, a leaf will always have degree 0. And the root will have height degree of 3. 

So, when it consider this quality of tree

Tree Height : Root node height is considers as tree's height. From the example, we can see tree height is =3. (sometimes you may see, the height represent all depth up to leaf and that consider adding 1 with height, so if you do that , it will be 4, in height calculation we will see details) 

Tree Degree :  The largest node degree is the degree of a tree. So, if a mix tree you calculate, the highest number of child under a node will be consider as degree of a tree. Let assume a tree where some node has 4 child , some has 2 child, so we will call the tree is 4 degree as at least one node has 4 child. 

Types of trees:

Based on Degree : When we categorize a tree based on number of children its node can have. For example

Binary Tree : When a node of a tree will have maximum 2 children(0,1,2).
So, in similar fashion, you may consider


Ternary tree , have maximum 3 children.
Quaternary tree, have maximum 4 children. and so on.




Based on Order : As I told in the beginning, a node hods data, so when a tree nodes are organized based on data value , then they are called ordered tree. Ordered tree is important when we are organizing a tree for using or traversing. We will see different traverse algorithm in different order in a tree. 

Based on Capacity : When a tree is categorized based on its node capacity or its each level capacity, then they are fall into this type of category.

Full tree : When All node will have either full capacity of node(order tree) that it can holds or zero nodes(a leaf). So, that means if a tree has 2 order, then we can get a full binary tree. 

Complete tree : When all the level of a tree(except the bottom/leaf level) are full and filled as full as possible from the left. This left is important, because we are actually prioritizing left filling over right. So two conditions here
1. Tree should have node in all levels except leaf or bottom level.
2. Tree is filled in left priority order (left should be filled before right) no matter what the tree order is. 


Perfect Tree : When all a tree has all of its leaf nodes in same level(bottom level) and all nodes are at its full capacity of child. So mainly two condition
1. All Level are full of nodes
2. All leaves are present in bottom level.

Here is binary tree example of all of these three types together. 


Now , Lets construct a generic Tree (later on we will apply binary tree using Java) 

Objectives : (I like this target driven approach ) : We need to make a tree which has
1. Node should hold data(of some type or any type)
2. Node can locate it's children (in simple words, the edges to get its children)
We also need some information during for making decision.
1. Is it root?
2. Is it leaf?
3. What is it's level?
4. What it it's height?
5. What it it'd parent?(optional as we can get child)
6. 


public class Node<T> {
    private List<Node<T>> children = new ArrayList<Node<T>>();
    private Node<T> parent = null;
    private T data = null;

    public Node(T data) {
        this.data = data;
    }

    public Node(T data, Node<T> parent) {
        this.data = data;
        this.parent = parent;
    }

    public List<Node<T>> getChildren() {
        return children;
    }

    public void setParent(Node<T> parent) {
        parent.addChild(this);
        this.parent = parent;
    }

    public void addChild(T data) {
        Node<T> child = new Node<T>(data);
        child.setParent(this);
        this.children.add(child);
    }

    public void addChild(Node<T> child) {
        child.setParent(this);
        this.children.add(child);
    }

    public T getData() {
        return this.data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public boolean isRoot() {
        return (this.parent == null);
    }

    public boolean isLeaf() {
        if(this.children.size() == 0) 
            return true;
        else 
            return false;
    }

    public void removeParent() {
        this.parent = null;
    }
}


And we will add some tests that proves that what we made , actually works. So, to test a Tree, we need to 

Note : I use all images from Internet , just added my words. 

----- Thanks.. :)