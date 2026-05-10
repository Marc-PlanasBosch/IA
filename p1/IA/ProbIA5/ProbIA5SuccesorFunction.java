package IA.ProbIA5;

import aima.search.framework.SuccessorFunction;
import aima.search.framework.Successor;
import java.util.ArrayList;
import java.util.List;

/**
 * Configuració des de Main/Test.
 * - flipType: CONSECUTIVE o RANDOM (com fem el flip)
 * - numberOfCoinsToFlip: FIXED_4 o CEIL_FALLES_2 (quantes monedes voltejar)
 * - childrenMode: FIXED (de moment només aquest)
 * - fixedChildren: quantes fills generar quan childrenMode=FIXED
 */
public class ProbIA5SuccesorFunction implements SuccessorFunction{

    public enum FlipType { CONSECUTIVE, RANDOM }

    /** Quantes monedes voltejar per moviment */
    public enum NumberOfCoinsToFlip { FIXED_4, CEIL_FALLES_2 }

    /** Nombre de fills a generar (de moment només FIXED) */
    public enum ChildrenMode { FIXED }

    private final FlipType flipType;
    private final NumberOfCoinsToFlip numberOfCoinsToFlip;
    private final ChildrenMode childrenMode;
    private final int fixedChildren;

    public ProbIA5SuccesorFunction(FlipType flipType, NumberOfCoinsToFlip numberOfCoinsToFlip,
                                   ChildrenMode childrenMode, int fixedChildren) {
        this.flipType = flipType;
        this.numberOfCoinsToFlip = numberOfCoinsToFlip;
        this.childrenMode = childrenMode;
        this.fixedChildren = fixedChildren;
    }

    private int getCoinsToFlip(ProbIA5Board board) {
        switch (numberOfCoinsToFlip) {
            case FIXED_4: return 4;
            case CEIL_FALLES_2:
                int misplaced = (int) board.heuristic();
                return (int) (Math.ceil(misplaced / 2.0));
            default: return 2;
        }
    }

    public List<Successor> getSuccessors(Object state){
        ArrayList<Successor> retval = new ArrayList<>();
        ProbIA5Board board = (ProbIA5Board) state;
        int k = getCoinsToFlip(board);
        int n = board.getSize();

        if (flipType == FlipType.CONSECUTIVE) {
            for (int i = 0; i < n; i++) {
                ProbIA5Board new_state = new ProbIA5Board(board);
                new_state.flip_consecutive(i, k);
                retval.add(new Successor("flip " + i + " (" + k + " consec)", new_state));
                if (childrenMode == ChildrenMode.FIXED && retval.size() >= fixedChildren) break;
            }
        } else {
            // RANDOM: totes les combinacions C(n,k), limitades si childrenMode=FIXED
            addCombinations(retval, board, new int[k], 0, 0, k, n);
        }

        return retval;
    }

    private void addCombinations(ArrayList<Successor> retval, ProbIA5Board board,
                                int[] indices, int idx, int start, int k, int n) {
        if (childrenMode == ChildrenMode.FIXED && retval.size() >= fixedChildren) return;
        if (idx == k) {
            ProbIA5Board new_state = new ProbIA5Board(board);
            new_state.flip_at(indices);
            StringBuilder sb = new StringBuilder("flip_random ");
            for (int i = 0; i < k; i++) sb.append(indices[i]).append(i < k-1 ? "," : "");
            retval.add(new Successor(sb.toString(), new_state));
            return;
        }
        for (int i = start; i <= n - (k - idx); i++) {
            indices[idx] = i;
            addCombinations(retval, board, indices, idx + 1, i + 1, k, n);
            if (childrenMode == ChildrenMode.FIXED && retval.size() >= fixedChildren) return;
        }
    }
}
