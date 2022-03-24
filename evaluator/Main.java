import java.io.IOException;

class Main {
    public static void main(String[] args) {
        try {
            System.out.printf("Final output :%d\n", (new TernaryEvaluator(System.in)).start());
        } catch (IOException | ParseError e) {
            System.err.println(e.getMessage());
        }
    }
}

