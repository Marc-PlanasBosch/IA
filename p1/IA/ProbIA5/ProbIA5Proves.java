package IA.ProbIA5;

import aima.search.framework.GraphSearch;
import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.AStarSearch;

import java.util.Iterator;
import java.util.List;
import java.util.Properties;

/**
 * Proves amb diferents configuracions.
 * Executar: java -cp ".;dist/AIMA.jar" IA.ProbIA5.ProbIA5Proves
 */
public class ProbIA5Proves {

    public static void main(String[] args) throws Exception {
        provaRandomCeilFalles();
    }

    private static void provaRandomCeilFalles() throws Exception {
        // Cas solvable: mateixa paritat d'uns (3 uns a ambdós)
        int[] prob = {0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1};
        int[] sol = {1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0};

        ProbIA5Board board = new ProbIA5Board(prob, sol);
        // fixedChildren=10 per assegurar que generem (1,2) que és la solució
        Problem p = new Problem(board,
                new ProbIA5SuccesorFunction(
                        ProbIA5SuccesorFunction.FlipType.RANDOM,
                        ProbIA5SuccesorFunction.NumberOfCoinsToFlip.CEIL_FALLES_2,
                        ProbIA5SuccesorFunction.ChildrenMode.FIXED,
                        10),
                new ProbIA5GoalTest(),
                new ProbIA5HeuristicFunction());

        runSearch(p, board, "RANDOM + CEIL_FALLES_2 + 10 fills");
    }

    private static void provaConsecutiveFixedChildren() throws Exception {
        int[] prob = {0, 0, 0, 0, 0, 0, 0, 0};
        int[] sol = {1, 1, 1, 1, 1, 1, 1, 1};

        ProbIA5Board board = new ProbIA5Board(prob, sol);
        Problem p = new Problem(board,
                new ProbIA5SuccesorFunction(
                        ProbIA5SuccesorFunction.FlipType.CONSECUTIVE,
                        ProbIA5SuccesorFunction.NumberOfCoinsToFlip.FIXED_4,
                        ProbIA5SuccesorFunction.ChildrenMode.FIXED,
                        4),
                new ProbIA5GoalTest(),
                new ProbIA5HeuristicFunction());

        runSearch(p, board, "CONSECUTIVE + FIXED_4 + 4 fills (8 monedes)");
    }

    private static void runSearch(Problem p, ProbIA5Board board, String nom) throws Exception {
        System.out.println("\n=== " + nom + " ===");

        // Debug: estat inicial
        System.out.println("[DEBUG] Estat inicial: " + arrayToString(board.getConfiguration()));
        System.out.println("[DEBUG] Heurística (mal col·locades): " + (int) board.heuristic());
        System.out.println("[DEBUG] És goal? " + board.is_goal());

        try {
            Search alg = new AStarSearch(new GraphSearch());
            SearchAgent agent = new SearchAgent(p, alg);
            List<?> actions = agent.getActions();
            Properties metrics = agent.getInstrumentation();

            System.out.println("[DEBUG] Accions trobades: " + actions.size());
            printActions(actions);
            System.out.println("[DEBUG] Mètriques:");
            printInstrumentation(metrics);
        } catch (Exception e) {
            System.err.println("[ERROR] Excepció: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private static String arrayToString(int[] a) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < a.length; i++) {
            sb.append(a[i]).append(i < a.length - 1 ? "," : "");
        }
        return sb.append("]").toString();
    }

    private static void printInstrumentation(Properties properties) {
        Iterator<?> keys = properties.keySet().iterator();
        while (keys.hasNext()) {
            String key = (String) keys.next();
            System.out.println(key + " : " + properties.getProperty(key));
        }
    }

    private static void printActions(List<?> actions) {
        for (Object a : actions) {
            System.out.println(a);
        }
    }
}
