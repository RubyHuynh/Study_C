#include<stdlib.h>
#include<stdio.h>

/*
 * Rules That Every Red-Black Tree Follows: 
 * Every node has a colour either red or black.
 * The root of the tree is always black.
 * There are no two adjacent red nodes (A red node cannot have a red parent or red child).
 * Every path from a node (including root) to any of its descendants NULL nodes has the same number of black nodes.
 * 1.	Search	O(log n)
 * 2.	Insert	O(log n)
 * 3.	Delete	O(log n)
 *
 * */
typedef enum COLOR {
	BLACK,
	RED
}COLOR;

typedef struct Node {
	int 			val;
	COLOR 			color;
	struct Node* 		parent;
	struct Node* 		right;
	struct Node* 		left;
} Node;

Node* root = NULL;

Node* bst(Node* node, Node* tmp) {
	printf("\t%s adding (%d)\n", __func__, tmp->val);
	if (!node) {
		return tmp;
	}

	if (tmp->val < node->val) {
		node->left = bst(node->left, tmp);
		node->left->parent = node;
	}
	else if (tmp->val > node->val) {
		node->right = bst(node->right, tmp);
		node->right->parent = node;
	}
	return node;
}

void rightRotate(Node* tmp) {
	Node* left = tmp->left;
	tmp->left = left->right;
	printf("\t%s\n", __func__);
	if (tmp->left) {
		tmp->left->parent = tmp;
	}
	left->parent = tmp->parent;
	if (!tmp->parent) {
		root = left;
	}
	else if (tmp == tmp->parent->left) {
		tmp->parent->left = left;
	}
	else {
		tmp->parent->right = left;
	}
	left->right = tmp;
	tmp->parent = left;
}


void leftRotate(Node* tmp) {
	Node* right = tmp->right;
	tmp->right = right->left;
	printf("\t%s\n", __func__);
	if (tmp->right) {
		tmp->right->parent = tmp;
	}
	right->parent = tmp->parent;
	if (!tmp->parent) {
		root = right;
	}
	else if (tmp == tmp->parent->left) {
		tmp->parent->left = right;
	}
	else {
		tmp->parent->right = right;
	}
	right->left = tmp;
	tmp->parent = right;
}

void fix(Node* root, Node* pt) {
	Node* parent_pt = NULL;
	Node* grand_parent_pt = NULL;

	printf("\t %s root(%d) pt(%d)\n", __func__, root->val, pt->val);
	while ((pt != root) && (pt->color != BLACK)
			&& (pt->parent->color == RED)) {
		printf("\t\t %s pt(%d)\n", __func__, pt->val);
		parent_pt = pt->parent;
		grand_parent_pt = pt->parent->parent;

		if (parent_pt == grand_parent_pt->left) {
			printf("\t\t\t CASE1\n");
			Node* uncle_pt = grand_parent_pt->right;
			if (uncle_pt && uncle_pt->color == RED) {
				grand_parent_pt->color = RED;
				parent_pt->color = uncle_pt->color = BLACK;
				pt = grand_parent_pt;
			}
			else {
				if (pt == parent_pt->right) {
					leftRotate(parent_pt);
					pt = parent_pt;
					parent_pt = pt->parent;
				}
				rightRotate(grand_parent_pt);
				{
					COLOR t = parent_pt->color;
					parent_pt->color = grand_parent_pt->color;
					grand_parent_pt->color = t;
					pt = parent_pt;
				}
			}
		}
		else {
			Node* uncle_pt = grand_parent_pt->left;
			printf("\t\t\t CASE2 uncle (%p)\n", uncle_pt);
			if (uncle_pt && uncle_pt->color == RED) {
				printf("\t\t\t CASE2.a\n");
				grand_parent_pt->color = RED;
				parent_pt->color = uncle_pt->color = BLACK;
				pt = grand_parent_pt;
			}
			else {
				printf("\t\t\t CASE2.b\n");
				if (pt == parent_pt->left) {
					printf("\t\t\t CASE2.b.1\n");
					rightRotate(parent_pt);
					pt = parent_pt;
					parent_pt = pt->parent;
				}
				leftRotate(grand_parent_pt);
				{
					COLOR t = parent_pt->color;
					parent_pt->color = grand_parent_pt->color;
					grand_parent_pt->color = t;
					pt = parent_pt;
				}
			}
		}
	}
	root->color = BLACK;
}

void dump(Node* node) {
	if (!node) return;

	dump(node->left);
	printf("%d(%s) ", node->val, node->color == BLACK ? "BLACK" : "RED");
	dump(node->right);
}


int main() {
	int n = 7;
	int a[7] = {10, 6, 15, 14, 3, 82, 1};
	int i = 0;
	for (; i < n; i++) {
		Node* tmp = (Node*) calloc(1, sizeof(Node));
		tmp->val = a[i];
		tmp->color = RED;

		root = bst(root, tmp);
		fix(root, tmp);
		printf("dump root (%d):\n", root->val);
		dump(root);
		printf("\n");
	}

	return 0;

}
