import java.io.RandomAccessFile;

public class SongBST {
    private class TreeNode {
        Song song;
        TreeNode left, right;
        TreeNode(Song s) { this.song = s; left = right = null; }
    }
    
    private TreeNode root;
    public SongBST() { root = null; }

    // Provided
    public void helper_fn(Song song) {
        if (root == null) {
            root = new TreeNode(song);
            return;
        }
        TreeNode current = root;
        TreeNode parent = null;
        while (current != null) {
            parent = current;
            int cmp = song.songId.compareTo(current.song.songId);
            if (cmp > 0) {
                current = current.left;
            } else if (cmp < 0) {
                current = current.right;
            } else {
                return;
            }
        }
        int cmp = song.songId.compareTo(parent.song.songId);
        if (cmp > 0) {
            parent.left = new TreeNode(song);
        } else {
            parent.right = new TreeNode(song);
        }
    }
    public Song search_f1(String songId) {
        TreeNode current = root;
        while (current != null) {
            int cmp = songId.compareTo(current.song.songId);
            if (cmp == 0) return current.song;
            if (cmp > 0) current = current.left;
            else current = current.right;
        }
        return null;
    }
    
    public Song search(String songId) {
        TreeNode current = root;
        while (current != null) {
            int cmp = songId.compareTo(current.song.songId);
            if (cmp == 0) return current.song;
            if (cmp < 0) current = current.left;
            else current = current.right;
        }
        return null;
    }
    
    // Provided
    public void ftraverse(RandomAccessFile f) throws Exception {
        f.writeBytes("--- Song Library (In-Order) ---\r\n");
        if (root == null) {
            f.writeBytes("Empty\r\n");
        } else {
            inOrder(root, f);
        }
    }
    
    private void inOrder(TreeNode node, RandomAccessFile f) throws Exception {
        if (node == null) return;
        inOrder(node.left, f);
        f.writeBytes(node.song.toString() + "\r\n");
        inOrder(node.right, f);
    }

    // =======================================================
    // === STUDENT IMPLEMENTATION AREA                     ===
    // =======================================================

    // f3: Insert a Song into the Library
    public void insert(Song song) {
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        root = insert(root, song);
        // -----------------------------------------------------
    }
    private TreeNode insert(TreeNode root, Song song){
        if(root == null){
            return new TreeNode(song);
        }
        if(song.songId.compareTo(root.song.songId) < 0){
            root.left = insert(root.left, song);
        } else{
            root.right = insert(root.right, song);
        }
        return root;
    }

    // f4: Count Songs within an ID Range
    public int countInRange(String minId, String maxId) {
        int count = 0;
        // ---------- Student's code starts from here ----------
        // Students are welcomed to use any helper function(s)
        count = 4;
        // -----------------------------------------------------
        return count;
    }
    // =======================================================
}