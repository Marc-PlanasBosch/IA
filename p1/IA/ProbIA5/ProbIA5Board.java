package IA.ProbIA5;

/**
 * Created by bejar on 17/01/17.
 */
public class ProbIA5Board {
    /* State data structure
       vector with the parity of the coins (0 = heads, 1 = tails)
     */
    private int [] board;
    private static int [] solution;

    /* Constructor */
    public ProbIA5Board(int []init, int[] goal) {
        board = new int[init.length];
        solution = new int[init.length];
        for (int i = 0; i< init.length; i++) {
            board[i] = init[i];
            solution[i] = goal[i];
        }
    }

    /** Volteja 2 monedes consecutives (posicions i i i+1, circular) */
    public void flip_it(int i){
        flip_consecutive(i, 2);
    }

    /** Volteja k monedes consecutives començant a start (circular) */
    public void flip_consecutive(int start, int k){
        for (int j = 0; j < k; j++) {
            int pos = (start + j) % board.length;
            board[pos] = 1 - board[pos];
        }
    }

    /** Volteja k monedes a les posicions donades (no consecutives) */
    public void flip_at(int... positions){
        for (int pos : positions) {
            board[pos] = 1 - board[pos];
        }
    }

    /* Heuristic function */
    public double heuristic(){
        // compute the number of coins out of place respect to solution
        int heuristic = 0;
        for (int i = 0; i < board.length; i++) {
            if (board[i] != solution[i]) {
                heuristic++;
            }
        }
        return heuristic;
    }

     /* Goal test */
     public boolean is_goal(){
         // compute if board = solution
         for (int i = 0; i < board.length; i++) {
            if (board[i] != solution[i]) {
                return false;
            }
         }
         return true;
     }

     public int getSize() {
         return board.length;
     }

     public int[] getConfiguration() {
         return board.clone();
     }

     // Some functions will be needed for creating a copy of the state
     public ProbIA5Board(ProbIA5Board original) {
        // Creem un nou array amb la mateixa mida
        board = new int[original.board.length];
        
        // Copiem els valors un per un
        for (int i = 0; i < board.length; i++) {
            board[i] = original.board[i];
        }
        // Nota: solution és static, no cal copiar-la (és compartida)
    }


}
