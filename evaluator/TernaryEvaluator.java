import java.io.InputStream;
import java.io.IOException;
/*
 * -------------------------------------------------------------------------
 * 	        |     '0' .. '9'     |  ':'    |       '?'          |  $    |
 * -------------------------------------------------------------------------
 * 	        |		             |	       |	                |       |
 * Tern      | '0'..'9' TernTail  |  error  |       error        | error |
 *           | 	   	             |	       |    	            |       |
 * -------------------------------------------------------------------------
 *           |		             |	       |		            |       |
 * TernTail  |       error	     |    e    |  '?' Tern ':' Tern |   e   |
 * 	        |	  	             |	       |    	     	    |       |
 * -------------------------------------------------------------------------
 */


class TernaryEvaluator {
    private final InputStream in;

    private int lookahead;

    public TernaryEvaluator(InputStream in) throws IOException {
        this.in = in;
        lookahead = in.read();
    }

    private void consume(int symbol) throws IOException, ParseError {
        if (lookahead == symbol) lookahead = in.read();
        else throw new ParseError();
    }

    private boolean isDigit(int c) {
        return '0' <= c && c <= '9';
    }

    private boolean isParenthesis(int c) {
        return '(' == c || c == ')';
    }

    private int evalDigit(int c) {
        return c - '0';
    }

    public int start() throws IOException, ParseError {
        int value = expression();
        System.out.print("end of story\n");
        if (lookahead != -1 && lookahead != '\n') throw new ParseError();
        return value;
    }

    private int expression() throws IOException, ParseError {
        return xorExpression(andExpression());
    }

    private int andExpression() throws IOException, ParseError {
        return andExpressionTail(Number());
    }

    private int andExpressionTail(int number) throws IOException, ParseError {
        int sum;
        switch (lookahead) {
            case '&':
                System.out.printf("inside the andExpressionTail and the lookahead symbol is %c\n", lookahead);
                consume('&');
                int resultFromNumber = Number();
                sum = number & resultFromNumber;
                System.out.printf("the result from previous andExpressionTail is %d\n", number);
                System.out.printf("(inside andExpression )the Number function returned %d\n", resultFromNumber);
                System.out.printf("the sum in andExpression is %d\n", sum);
                return andExpressionTail(sum);
            case '\n':
            case '^':
                return number;
        }
        return number;
        //System.out.print("parseError from andExpressionTail\n");
        //throw new ParseError();
    }

    private int xorExpression(int number) throws IOException, ParseError {
        int value = number;
        if (lookahead == '^') {
            System.out.print("inside the xorExpresion and the lookahead symbol is ^\n");
            consume('^');
            //if (isDigit(lookahead) || isParenthesis(lookahead)) {
            value = value ^ andExpression();
            System.out.printf("the total result is %d\n", value);
            System.out.printf("inside the xorExpresion and the lookahead is %c\n", lookahead);
            //}
            return xorExpression(value);
        } else if (lookahead == '\n' || lookahead == ')') {
            System.out.println("the lookahead is NewLine and xorEpression does nothing\n");
            return number;
        }
        return number;
        //throw new ParseError();
    }

    private int Number() throws IOException, ParseError {
        System.out.print("inside number\n");
        int inputNumber = 0;
        if (isDigit(lookahead)) {
            inputNumber = evalDigit(lookahead);
            System.out.printf("the Number function returned %d\n", inputNumber);
            consume(lookahead);
            return inputNumber;
        } else if (isParenthesis(lookahead)) {
            System.out.print("the Number function returned ( \n");
            consume('(');
            inputNumber = expression();
            consume(')');
            System.out.print("the Number function returned ) \n");
            return inputNumber;
        }
        return inputNumber;
    }
}
