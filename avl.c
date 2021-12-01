#include<stdio.h>
#include<stdlib.h>

typedef struct Node {
	int 		key;
	int 		height;
	struct Node*	left;
	struct Node*	right;
} Node;

int max(int a, int b) {
	return a > b ? a : b;
}

int height(Node* node) {
	if (!node) return 0;
	return node->height;
}

Node* newNode(int key) {
	Node* item = (Node*) calloc(1, sizeof(Node));
	item->key = key;
	item->height = 1;
	return item;
}

Node* rightRotate(Node* node) {
	Node* left = node->left;
	Node* right = left->right;

	left->right = node;
	node->left = right;

	node->height = max(height(node->left), height(node->right)) + 1;
	left->height = max(height(left->left), height(left->right)) + 1;
	printf("\t%s old root (%d) new root(%d) \n", __func__, node->key, left->key);

	return left;
}


Node* leftRotate(Node* node) {
	Node* right = node->right;
	Node* left = right->left;

	right->left = node;
	node->right = left;

	node->height = max(height(node->left), height(node->right)) + 1;
	right->height = max(height(right->left), height(right->right)) + 1;
	printf("\t%s old root (%d) new root(%d) \n", __func__, node->key, right->key);
	return right;
}

int getBalance(Node* node) {
	if (!node) return 0;
	return height(node->left) - height(node->right);
}

Node* insert(Node* node, int key) {
	int balance;

	if (!node) return newNode(key);

	printf("%s current root (%d), adding (%d)\n", __func__, node->key, key);

	if (key < node->key) 
		node->left = insert(node->left, key);
	else if (key > node->key)
		node->right = insert(node->right, key);
	else
		return node;

	node->height = 1 + max(height(node->left), height(node->right));

	balance = getBalance(node);
	if (balance > 1 && key < node->left->key) {
		return rightRotate(node);
	}
	if (balance < -1 && key > node->right->key) {
		return leftRotate(node);
	}

	if (balance > 1 && key > node->left->key) {
		node->left = leftRotate(node->left);
		return rightRotate(node);
	}

	if (balance < -1 && key < node->right->key) {
		node->right = rightRotate(node->right);
		return leftRotate(node);
	}

	return node;
}

struct Node * minVal(struct Node* node)
{
	struct Node* current = node;

	/* loop down to find the leftmost leaf */
	while (current->left != NULL)
		current = current->left;

	return current;
}

Node* delete(Node* root, int key) {
	int balance;
	
	if (!root) return root;

	if (key < root->key)
		root->left = delete(root->left, key);
	else if (key > root->key)
		root->right = delete(root->right, key);
	else {
		if (!root->left || !root->right) {
			Node* tmp = root->left ? root->left : root->right;
			if (!tmp) {
				tmp = root;
				root = NULL;
			}
			else {
				*root = *tmp;
			}

			free(tmp);
		}
		else {
			Node* tmp = minVal(root->right);
			root->key = tmp->key;
			root->right = delete(root->right, tmp->key);
		}
	}
	if (!root) {
		return root;
	}
	root->height = 1 + max(height(root->left), height(root->right));
	balance = getBalance(root);
	if (balance > 1 && getBalance(root->left) >= 0)
		return rightRotate(root);
	if (balance > 1 && getBalance(root->left) < 0)
	{
		root->left =  leftRotate(root->left);
		return rightRotate(root);
	}
	if (balance < -1 && getBalance(root->right) <= 0)
		return leftRotate(root);

	if (balance < -1 && getBalance(root->right) > 0)
	{
		root->right = rightRotate(root->right);
		return leftRotate(root);
	}

	return root;
}


void dump(Node* root) {
	if (root) {
		printf("%d\t", root->key);
		dump(root->left);
		dump(root->right);
	}
}

int main() {
	Node* root = NULL;

	root = insert(root, 10);
	root = insert(root, 20);
	root = insert(root, 30);
	root = insert(root, 40);
	root = insert(root, 50);
	root = insert(root, 25);

	printf("dump AVL:\n");
	dump(root);
	printf("\n");

	root = delete(root, 40);
	printf("dump AVL after delete:\n");
	dump(root);
	printf("\n");
	return 0;
}
