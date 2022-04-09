import java_cup.runtime.*;
import java.io.*;


class Main {
    public static void main(String[] argv) throws Exception{
        //Instantiating the File class
        File file = new File("main.java");
        //Instantiating the PrintStream class
        PrintStream stream = new PrintStream(file);
        System.setOut(stream);
        Parser p = new Parser(new Scanner(new InputStreamReader(System.in)));
        p.parse();
    }
}
