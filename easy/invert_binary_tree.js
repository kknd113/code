/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var invertTree = function(root) {
    if(!root) return null;
    if(root.left) root.left = invertTree(root.left);
    if(root.right) root.right = invertTree(root.right);
    if(root.left || root.right){
        v
        temp = root.left
        root.left = root.right;
        root.right = temp;    
    }
    return root;
};
